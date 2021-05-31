class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :title,                nill: false
      t.text :description,            nill: false
      t.integer :category_id,         nill: false
      t.integer :price,               nill: false
      t.integer :condition_id,        nill: false
      t.integer :delivery_charge_id,  nill: false
      t.integer :delivery_area_id,    nill: false
      t.integer :delivery_day_id,     nill: false
      t.references :user,             nill: false, foreign_key: true
    end
  end
end
