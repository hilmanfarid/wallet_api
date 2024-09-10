class AddAccountsRefToTransactions < ActiveRecord::Migration[7.2]
  def change
    add_foreign_key :transactions, :deposits, column: :deposit_id
    add_foreign_key :transactions, :withdrawals, column: :withdrawal_id
    add_foreign_key :transactions, :users, column: :user_id
    add_foreign_key :transactions, :accounts, column: :source_account_id
    add_foreign_key :transactions, :accounts, column: :destination_account_id
  end
end
