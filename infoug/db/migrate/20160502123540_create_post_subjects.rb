class CreatePostSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :post_subjects do |t|
      t.references :subject, foreign_key: true
      t.references :user, foreign_key: true
      t.string :topic
      t.string :text

      t.timestamps
    end
  end
end
