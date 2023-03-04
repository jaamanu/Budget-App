class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups, foreign_key: 'user_id', class_name: 'Group'
  has_many :entities, foreign_key: 'user_id', class_name: 'Entity'

  validates :name, presence: true
end
