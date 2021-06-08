class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :municipalities, :address_number, :building_name, :phone_number, :user_id, :item_id

  
end