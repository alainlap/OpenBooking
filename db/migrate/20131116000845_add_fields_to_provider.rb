class AddFieldsToProvider < ActiveRecord::Migration
  def change 
  	add_column :providers, :description, :text
  	add_column :providers, :website, :string
  	add_column :providers, :phone_number, :string

  	add_column :clients, :phone_number, :string
  end
end
