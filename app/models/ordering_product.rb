class OrderingProduct < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { not_produced: 0, awaiting_production: 1, under_manufacture: 2, complete_prodution: 3 }
end
