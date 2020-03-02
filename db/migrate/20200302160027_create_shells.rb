class CreateShells < ActiveRecord::Migration[6.0]
  def change
    create_table :shells do |t|
      t.string :color
      t.string :image

      t.timestamps
    end
  end
end
