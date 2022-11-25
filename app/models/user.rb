class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recommendations
  has_many :recommended_pathways, through: :recommendations
  has_many :pathways, through: :recommended_pathways
  has_many :recommended_courses, through: :pathways
  has_many :courses, through: :recommended_courses

  validates :first_name, presence: true
  validates :last_name, presence: true
end
