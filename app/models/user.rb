class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         has_many :orders
        
         with_options presence: true do
              
              validates :nickname
              validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
              validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
              validates :first_name_kana, format: { with: /\A[ァ-ヴ]+\z/}
              validates :family_name_kana, format: { with: /\A[ァ-ヴ]+\z/ }
              validates :birthday
           end
           validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
     end