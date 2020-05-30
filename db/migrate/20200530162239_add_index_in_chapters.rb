class AddIndexInChapters < ActiveRecord::Migration[6.0]
  def change
    add_index :chapters, :volume_id
    add_index :chapters, :book_id
  end
end
