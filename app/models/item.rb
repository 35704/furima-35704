class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_area
  belongs_to :delivery_charge
  belongs_to :delivery_day
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :description
    validates :price, inclusion: { in: 300..9999999 }, format: { with: /\A[\d]+\z/ }
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_charge_id
      validates :delivery_area_id
      validates :delivery_day_id
    end  
  end
end
