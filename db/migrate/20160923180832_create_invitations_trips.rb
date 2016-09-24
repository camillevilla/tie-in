class CreateInvitationsTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations_trips do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :trip_id
      t.boolean :accepted
    end
  end
end
