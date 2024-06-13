class TabFile < ApplicationRecord
  
  validates :purchaser_name, presence: true
  validates :item_description, presence: true
  validates :item_price, numericality: { greater_than: 0 }
  validates :purchase_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :merchant_address, presence: true
  validates :merchant_name, presence: true
end
