class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :original_name
      t.integer :author_id
      t.integer :roles_id
      t.text :description
      t.integer :chapters_count
      t.date :year
      t.integer :group_id
      t.integer :catalog_id
      t.float :amount
      t.jsonb :tags_ids
      t.jsonb :genre_ids
      t.integer :book_settings_id
      t.float :rating
      t.timestamps
    end
  end
end
