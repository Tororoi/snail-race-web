class AddExistsToSnails < ActiveRecord::Migration[6.0]
  def change
    add_column :snails, :exists, :boolean, default: :true
  end
end
