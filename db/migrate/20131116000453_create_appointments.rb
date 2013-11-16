class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.string :reason
      t.text :description
      t.integer :provider_id
      t.integer :client_id

      t.timestamps
    end
  end
end
