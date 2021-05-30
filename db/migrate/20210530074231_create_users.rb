class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :short_introduction
      t.string :introduction
      t.integer :category_id

      t.timestamps
    end
  end
end
