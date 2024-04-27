class AddUpdateTimeToTransits < ActiveRecord::Migration[7.1]
  def change
    add_column :transits, :updatedtime, :string
  end
end
