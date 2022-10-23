class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :ordering_products, dependent: :destroy
  belongs_to :genre
  has_one_attached :image

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    item.with_tax_price * amount
  end

  def sumamount
    Item.sum(:amount)
  end

  enum is_active: { now_on_sale: true, sales_are_suspended: false }

  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
