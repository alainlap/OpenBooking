class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :postal_code
      t.string :city
      t.string :province
      t.integer :user_id
      t.string :phone_number

      t.timestamps
    end
  end
end
