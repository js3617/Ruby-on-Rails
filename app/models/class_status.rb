class ClassStatus < ApplicationRecord
  belongs_to :user
  belongs_to :class_list
	
  # MAX_TOTAL = 15

	def self.exceeds_capacity?(class_list_id)
		current_size = where(class_list_id: class_list_id).size
		max_capacity = ClassList.find(class_list_id).c_account
		current_size >= max_capacity
	end
	
	def self.applied?(user_id, class_list_id)
		exists?(user_id: user_id, class_list_id: class_list_id)
	end
	
	def can_add_unit?(new_unit)
		user.can_add_unit?(class_list.unit || 0)
	end

end

