class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :municipalities, :address_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :user_id
    validates :item_id
    validates :municipalities
    validates :address_number
    validates :phone_number
    validates :delivery_area_id, numericality: { other_than: 1 }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, delivery_area_id: delivery_area_id, municipalities: municipalities, address_number: address_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end