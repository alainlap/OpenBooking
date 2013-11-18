class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
    	t.integer :day
    	t.time :start_time
    	t.time :end_time
    	t.integer :provider_id 
      t.timestamps
    end
  end
end
