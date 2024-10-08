class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :nickname, presence: true
 validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/,
                                message: 'must include both letters and numbers'
                              }
 validates :lastname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
 validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
 validates :lastname_yomi, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
 validates :firstname_yomi, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
 validates :birthday, presence: true

 has_many :items
 has_many :histories

end
