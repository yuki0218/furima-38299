class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :send_days
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :send_days_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format:{with: /\A[\d]+\z/}
end
