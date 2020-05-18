class CreateBookSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :book_settings do |t|
      t.integer :book_id
      t.boolean :may_download
      t.boolean :may_copied
      t.boolean :payment_all_book
      t.boolean :payment
      t.string :status

      t.timestamps
    end
  end
end
