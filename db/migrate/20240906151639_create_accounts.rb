class CreateAccounts < ActiveRecord::Migration[7.2]
  def change
    create_table :accounts, unsigned: true do |t|
      t.belongs_to :user, foreign_key: true, unsigned: true
      t.string :account_number, limit: 32, null: false
      t.string :account_name, limit: 64, null: false
      t.integer :status, unsigned: true, limit: 1

      t.timestamps
      t.index "account_number", name: "index_accounts_on_account_number", unique: true
    end
  end
end
