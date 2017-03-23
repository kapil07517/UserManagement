class User < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  validates :email, presence: {uniqueness: true}
  has_many :user_roles
  has_many :images
end
