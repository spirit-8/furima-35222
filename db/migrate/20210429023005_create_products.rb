class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,                null: false
      t.text :description,           null: false
      t.references :user,            null: false, foreign_key: true
      t.integer :category_id,        null: false
      t.integer :status_id,          null: false
      t.integer :delivery_charge_id, null: false
      t.integer :prefecture_id,      null: false
      t.integer :until_delivery_id,  null: false
      t.integer :price,              null: false
      t.timestamps
    end
  end
end
