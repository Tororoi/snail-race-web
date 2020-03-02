class CreatePrizes < ActiveRecord::Migration[6.0]
  def change
    create_table :prizes do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
