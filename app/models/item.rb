class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :ordering_products, dependent: :destroy
  belongs_to :genre
end
