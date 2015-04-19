json.array!(@managements) do |management|
  json.extract! management, :id, :name, :prefecture, :zip_code, :address, :address_number, :district, :city, :state, :phone
  json.url management_url(management, format: :json)
end
