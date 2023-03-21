class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_description
      t.datetime :event_time

      t.timestamps
    end
  end
end
