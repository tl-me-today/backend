class ChangeTagsColumnInBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :tags_ids
    remove_column :books, :genre_ids
    add_column :books, :tags_ids, :text, array: true, default: []
    add_column :books, :genre_ids, :text, array: true, default: []
  end
end
