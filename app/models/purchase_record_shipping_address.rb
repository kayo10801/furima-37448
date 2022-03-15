class PurchaseRecordShippingAddress

  include ActiveModel::Model
  attr_accessor :post_cord, :prefecture_id, :city, :address, :phone_number, :building_name, :furima_id, :user_id, :token

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  with_options presence: true do
    validates :post_cord, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A^(0{1}\d{9,10})$\z/, message: "is invalid. Input only number"}
    validates :furima_id
    validates :user_id
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(furima_id: furima_id, user_id: user_id)
  
     ShippingAddress.create(post_cord: post_cord, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, building_name: building_name, purchase_record_id: purchase_record.id)
  end
  
end