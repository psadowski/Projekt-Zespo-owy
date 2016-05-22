class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
