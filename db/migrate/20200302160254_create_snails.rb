class CreateSnails < ActiveRecord::Migration[6.0]
  def change
    create_table :snails do |t|
      t.string :name
      t.belongs_to :shell, null: false, foreign_key: true
      t.belongs_to :body, null: false, foreign_key: true
      t.float :speed
      t.string :favorite_food

      t.timestamps
    end
  end
end
