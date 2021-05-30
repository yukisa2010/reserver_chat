class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :plan_name
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
