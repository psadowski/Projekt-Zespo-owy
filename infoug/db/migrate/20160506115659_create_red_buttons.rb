class CreateRedButtons < ActiveRecord::Migration[5.0]
  def change
    create_table :red_buttons do |t|
      t.boolean :button

      t.timestamps
    end
  end
end
