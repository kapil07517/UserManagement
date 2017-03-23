class Role < ActiveRecord::Base
  validates :role_name, presence: true, uniqueness: true
end
