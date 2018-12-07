class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.string :thumbnail
      t.string :description
      t.string :created_at
      t.string :updated_at

      t.timestamps
    end
    add_index :projects, :title, unique: true
  end
end
