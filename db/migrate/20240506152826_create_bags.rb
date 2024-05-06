class CreateBags < ActiveRecord::Migration[7.1]
  def change
    create_table :bags do |t|
      t.string :name
      t.string :brand
      t.integer :price
      t.string :description
      t.string :picture_url
      t.string :condition
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
