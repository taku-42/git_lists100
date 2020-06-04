class User < ApplicationRecord
  validates :nickname, presence: true
  validates_presence_of :image
  
  has_many :questions, ->{ order("created_at DESC")}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :image
end
