class CreateBodies < ActiveRecord::Migration[6.0]
  def change
    create_table :bodies do |t|
      t.string :color
      t.string :image

      t.timestamps
    end
  end
end
