class CreateTripInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :trip_invitations do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :trip_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
