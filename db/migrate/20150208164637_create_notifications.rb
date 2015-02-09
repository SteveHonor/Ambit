class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :owner_name
      t.string :owner_identifier
      t.string :owner_zip_code
      t.string :owner_address
      t.string :owner_address_number
      t.string :owner_address_complement
      t.string :owner_district
      t.string :owner_city
      t.string :owner_state
      t.string :owner_ddd_mobile
      t.string :owner_mobile
      t.string :owner_ddd_phone
      t.string :owner_phone
      t.string :property_zone
      t.string :property_zip_code
      t.string :property_address
      t.string :property_address_number
      t.string :property_address_complement
      t.string :property_district
      t.string :property_city
      t.string :property_state
      t.string :property_meter
      t.string :property_block
      t.string :property_allotment
      t.string :observation
      t.string :state
    end
  end
end
