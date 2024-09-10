module Serializer
  class Transaction
    def initialize(transaction)
      @transaction_id = transaction.id
      @source_account_number = transaction.source_account&.account_number&.gsub(/.(?=.{6})/, "#")
      @source_account_name = transaction.source_account&.account_name
      @destination_account_number = transaction.destination_account&.account_number&.gsub(/.(?=.{6})/, "#")
      @destination_account_name = transaction.destination_account&.account_name
      @amount = transaction.amount
      @status = Constants::TRANSACTION_STATE_MESSAGE[transaction.state]
      @created_at = transaction.created_at
    end
  end
end