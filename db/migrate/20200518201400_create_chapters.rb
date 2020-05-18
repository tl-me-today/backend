class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.integer :book_id
      t.string :name
      t.text :body
      t.integer :volume_id

      t.timestamps
    end
  end
end
