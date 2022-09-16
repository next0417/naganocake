class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordering_products
end
