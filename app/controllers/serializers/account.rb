module Serializer
  class Account
    attr_accessor :account_id, :account_number, :account_name, :balance

    def initialize(account)
      @account_id = account.id
      @account_number = account.account_number
      @account_name = account.account_name
      @balance = account.balance
    end
  end
end