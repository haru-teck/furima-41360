class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


 validates :nickname, presence: true
 validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
 validates :lastname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
 validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
 validates :lastname_yomi, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
 validates :firstname_yomi, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
 validates :birthday, presence: true

 
end
