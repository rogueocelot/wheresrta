class AddUpdateTimeToBuses < ActiveRecord::Migration[7.1]
  def change
    add_column :buses, :updatedtime, :string
  end
end
