class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :description
    validates :category_id
    validates :price
    validates :condition_id
    validates :delivery_charge_id
    validates :delivery_area_id
    validates :delivery_day_id
    validates :image
  end
end
