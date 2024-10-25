class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	
  	has_many :class_statuses
	has_many :users, :through => :class_statuses
	
	def current_unit
		ClassStatus.where(user_id: id).joins(:class_list).sum(:unit) || 0
	end
	
	def can_add_unit?(unit)
		(current_unit + new_unit) <= max_unit
	end
end 