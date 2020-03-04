class CreateRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :races do |t|
      t.string :name
      t.belongs_to :prize, null: false, foreign_key: true

      t.timestamps
    end
  end
end
