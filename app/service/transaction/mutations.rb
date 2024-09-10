class Transaction::Mutations
  class << self
    def perform(current_user, account_id)
      account = Account.find(account_id)
      raise Errors::InvalidAccount if account.user_id != current_user.id

      Transaction.mutations(account_id)
    end
  end
end