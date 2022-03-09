class PurchaseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :furima
  has_one :shipping_address

end
