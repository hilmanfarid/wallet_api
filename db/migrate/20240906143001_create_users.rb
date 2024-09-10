class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users, unsigned: true do |t|
      t.string :username, limit: 64, null: false
      t.string :crypted_password, null: false
      t.string :secret
      t.string :token
      t.integer :status, unsigned: true, limit: 1

      t.timestamps
      t.index "username", name: "index_users_on_username", unique: true
    end
  end
end

