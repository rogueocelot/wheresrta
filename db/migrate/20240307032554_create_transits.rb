class CreateTransits < ActiveRecord::Migration[7.1]
  def change
    create_table :transits do |t|
      t.string :tripid
      t.integer :routeid
      t.float :lat
      t.float :long
      t.float :bearing

      t.timestamps
    end
  end
end
