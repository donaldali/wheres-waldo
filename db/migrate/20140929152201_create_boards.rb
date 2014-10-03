class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name

      t.timestamps
    end

    add_index :boards, :name
  end
end
