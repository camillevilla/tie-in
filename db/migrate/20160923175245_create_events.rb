class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :trip_id
      t.integer :creator_id
      t.string :name
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :location_id
      t.boolean :privacy

      t.timestamps
    end
  end
end
