class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.references :project, null: false
      t.references :user, null: false
      t.string :title, null: false
      t.integer :type, null: false
      t.string :created_at
      t.string :updated_at

      t.timestamps
    end
    add_index :contents, :title, unique: true
  end
end
