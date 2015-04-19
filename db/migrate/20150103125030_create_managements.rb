class CreateManagements < ActiveRecord::Migration
  def change
    create_table :managements do |t|
      t.string :name
      t.string :prefecture
      t.string :zip_code
      t.string :address
      t.string :address_number
      t.string :district
      t.string :city
      t.string :state
      t.string :phone

      t.timestamps null: false
    end
  end
end
