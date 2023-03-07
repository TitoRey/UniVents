class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :owner_id
      t.string :event_name
      t.string :event_description
      t.integer :event_location_id
      t.datetime :event_time

      t.timestamps
    end
  end
end
