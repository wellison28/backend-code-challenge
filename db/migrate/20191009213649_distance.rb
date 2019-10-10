class Distance < ActiveRecord::Migration[5.2]
  def change
    create_table :distances do |t|
      t.string :origin, null: false
      t.string :destination, null: false
      t.integer :kilometers, null: false
    end
  end
end
