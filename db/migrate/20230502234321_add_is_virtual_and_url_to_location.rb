class AddIsVirtualAndUrlToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :is_virtual, :boolean
    add_column :locations, :url, :string
  end
end
