class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :address
      t.string :postal_code
      t.string :city
      t.string :province
      t.integer :type_id
      t.integer :user_id
      t.text :description
      t.string :website
      t.string :phone_number

      t.timestamps
    end
  end
end
