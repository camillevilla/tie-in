class CreateTransits < ActiveRecord::Migration[5.0]
  def change
    create_table :transits do |t|
      # t.integer :creator_id
      # t.integer :trip_id
      # t.boolean :arrival
      # # t.integer :transit_id
      # t.string :transit_type
      # t.datetime :start_time
      # t.datetime :end_time

      t.integer :creator_id
      t.integer :trip_id
      t.boolean :arrival
      t.string :airline
      t.string :flight_number
      t.string :origin
      t.string :destination
      t.string :transit_type
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
