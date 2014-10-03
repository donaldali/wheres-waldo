class ChangeScores < ActiveRecord::Migration
  def change
    change_table :scores do |t|
      t.remove :player
      t.references :board
      t.references :player
    end
  end
end
