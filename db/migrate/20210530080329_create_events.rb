class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :plan_id
      t.integer :organizer_id
      t.integer :participant_id
      t.datetime :scheduled_datetime

      t.timestamps
    end
  end
end
