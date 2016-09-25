  class CreateAccommodationsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :accommodations_users do |t|
      t.integer :user_id
      t.integer :accommodation_id
    end
  end
end
