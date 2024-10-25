class AddUnitToUser < ActiveRecord::Migration[6.0]
  def change
	  add_column :users, :max_unit, :integer, default: 18
  end
end
