class CreateTripsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :trips_users do |t|
      t.integer :user_id
      t.integer :trip_id
    end
  end
end
