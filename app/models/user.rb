class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :listings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :carts, dependent: :destroy

  def cart
    return Cart.find_by(user_id: id, completed: false) || Cart.create(user_id: id, completed: false, price: 0)
  end
end
