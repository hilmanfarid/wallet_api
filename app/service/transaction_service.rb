# frozen_string_literal: true

module TransactionService
  module_function

  def transfer(current_user, payload)
    Transaction::Transfer.perform(current_user, payload)
  end

  def mutations(current_user, account_id)
    Transaction::Mutations.perform(current_user, account_id)
  end
end
