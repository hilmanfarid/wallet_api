class Transaction::Transfer
  class << self
    def perform(current_user, payload)
      ActiveRecord::Base.transaction do
        @current_user = current_user
        @source_account = validate_source_account(payload)
        @destination_account = validate_destination_account(payload)

        @transaction = Transaction.new(
          user_id: @current_user.id,
          source_account_id: @source_account.id,
          destination_account_id: @destination_account.id,
          state: Constants::TransactionState::CREATED,
          amount: payload.amount
        )
        execute_transfer
        @transaction.save!
      rescue ApplicationError => e
        @transaction.message = e.message
        @transaction.state = Constants::TransactionState::FAILED
      rescue StandardError => e
        raise Errors::UnprocessableEntityError
      end

      @transaction
    end

    private

    def execute_transfer
      ActiveRecord::Base.transaction do
        withdrawal = Withdrawal.create(account_id: @source_account.id, amount: @transaction.amount)
        unless ENV["MAX_DEPOSIT"].blank?
          raise Errors::TransactionLimitError if @transaction.amount > ENV["MAX_DEPOSIT"].to_f
        end
        deposit = Deposit.create(account_id: @destination_account.id, amount: @transaction.amount)

        @transaction.withdrawal_id = withdrawal.id
        @transaction.deposit_id = deposit.id
        @transaction.message = "success"
        @transaction.state = Constants::TransactionState::SUCCEEDED
      end
    end

    def validate_destination_account(payload)
      if payload.source_account == payload.destination_account
        raise Errors::InvalidDestinationError
      end
      account = Account.find_by_account_number(payload.destination_account)
      raise Errors::InvalidDestinationError if account.nil?

      account
    end

    def validate_source_account(payload)
      account = Account.find_by_account_number(payload.source_account)
      raise Errors::InvalidSourceAccount if account.nil?
      raise Errors::InvalidSourceAccount if account.user_id != @current_user.id

      account
    end

    def validate_source_balance
      balance = @source_account.balance

      raise Errors::InsufficientBalanceError if balance < @transaction.amount
    end
  end
end