class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :schedule_day

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :prefecture_id
    validates :schedule_day_id
    validates :price
    validates :user_id
  end
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}

  with_options numericality: {other_than: 1} do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :prefecture_id
    validates :schedule_day_id
  end
end