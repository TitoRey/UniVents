class AddLocationTable < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :street_address
      t.integer :zipcode
      t.string :county
      t.string :city
      t.string :coordinates
      t.timestamps null: false
    end
  end
end
