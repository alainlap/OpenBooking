class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
    	t.integer :day
    	t.integer :start_time
    	t.integer :end_time
    	t.integer :provider_id 
      t.timestamps
    end
  end
end
