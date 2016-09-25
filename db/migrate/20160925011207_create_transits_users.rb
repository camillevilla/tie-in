class CreateTransitsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :transits_users do |t|
      t.integer :user_id
      t.integer :transit_id
    end
  end
end
