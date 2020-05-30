class DeleteTagsCOlumnFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :tags_ids
    remove_column :books, :genre_ids
    remove_column :books, :roles_id

    add_index :books, :author_id
    add_index :books, :catalog_id
    add_index :books, :user_id
    add_index :books, :chapters_count
    add_index :books, :rating
  end
end
