class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.float :money
      t.float :rating
      t.integer :contacts_id
      t.integer :settings_id
      t.integer :group_id

      t.timestamps
    end
  end
end
