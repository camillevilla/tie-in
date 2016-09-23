class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|

      t.timestamps
    end
  end
end
