class CreateDeposits < ActiveRecord::Migration[7.2]
  def change
    create_table :deposits, unsigned: true do |t|
      t.belongs_to :account, foreign_key: true, unsigned: true
      t.decimal :amount, precision: 15, scale: 3, null: false

      t.timestamps
    end
  end
end
