class AddColumnToUserDepartment < ActiveRecord::Migration[5.0]
  def change
    add_column :user_departments, :user_id, :integer
    add_column :user_departments, :department_id, :integer
  end
end
