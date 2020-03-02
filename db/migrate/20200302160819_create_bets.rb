class CreateBets < ActiveRecord::Migration[6.0]
  def change
    create_table :bets do |t|
      t.belongs_to :snail_race, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
