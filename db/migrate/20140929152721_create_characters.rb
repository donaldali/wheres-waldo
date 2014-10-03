class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string  :name
      t.integer :top_left_x
      t.integer :top_left_y
      t.integer :width
      t.integer :height
      t.references :board

      t.timestamps
    end

    add_index :characters, :name
  end
end
