class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :password_digest, null: false
      t.string :token, null: true
      t.string :email, null: false
      t.string :name, null: false
      t.string :created_at
      t.string :updated_at

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :name, unique: true
  end
end
