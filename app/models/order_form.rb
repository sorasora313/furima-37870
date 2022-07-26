class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :telephone,:token


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1}
    validates :city   
    validates :address
    validates :telephone,format:{ with: /\A[0-9]{10,11}\z/,}
    validates :token
  end
    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Buyer.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone: telephone)
      
  end
end