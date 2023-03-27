class AddEventToLocations < ActiveRecord::Migration[7.0]
  def change
    add_reference :locations, :event, null: false, foreign_key: true
    add_foreign_key :locations, :events
  end
end
