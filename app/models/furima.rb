class Furima < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :days_to_ship

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image
  
  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 , message: "is out of setting range"}
    
  end
    with_options numericality: { other_than: 1 , message: "can't be blank"} do
      validates :category_id 
      validates :condition_id
      validates :postage_id
      validates :prefecture_id
      validates :days_to_ship_id
    end       
  
end
 