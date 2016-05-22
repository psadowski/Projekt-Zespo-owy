class AddColumnToUserSubject < ActiveRecord::Migration[5.0]
  def change
    add_column :user_subjects, :user_id, :integer
    add_column :user_subjects, :subject_id, :integer
  end
end
