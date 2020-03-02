class CreateSnailRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :snail_races do |t|
      t.belongs_to :snail, null: false, foreign_key: true
      t.belongs_to :race, null: false, foreign_key: true
      t.float :odds
      t.integer :rank

      t.timestamps
    end
  end
end
