class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.bigint :user_id, null: false, unsigned: true
      t.bigint :deposit_id, unsigned: true
      t.bigint :withdrawal_id, unsigned: true
      t.bigint :source_account_id, unsigned: true
      t.bigint :destination_account_id, unsigned: true
      t.integer :state, unsigned: true, limit: 1
      t.decimal :amount, precision: 15, scale: 3, null: false
      t.datetime :succeeded_at
      t.datetime :failed_at
      t.string :message
      t.timestamps
    end
  end
end
