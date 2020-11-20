class CreateDesigns < ActiveRecord::Migration[6.0]
  def change
    create_table :designs do |t|
      t.integer :user_id
      t.string :title
      t.string :main_img
      t.string :img_1
      t.string :img_2
      t.string :img_3
      t.string :img_4
      t.string :img_5
      t.string :img_6
      t.string :description
      t.string :category

      t.timestamps
    end
  end
end
