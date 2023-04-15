class AddFlaggedToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :flagged, :boolean, default: false
  end
end
