class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :title, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :ship_day_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price, numericality: { only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message:"can't be blank" }
  validates :image, presence: true

  belongs_to :user
  has_one :history 
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ship_day

  def sold?
    history.present?
  end


end
