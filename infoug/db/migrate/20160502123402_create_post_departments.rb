class CreatePostDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :post_departments do |t|
      t.references :department, foreign_key: true
      t.references :user, foreign_key: true
      t.string :topic
      t.string :text

      t.timestamps
    end
  end
end
