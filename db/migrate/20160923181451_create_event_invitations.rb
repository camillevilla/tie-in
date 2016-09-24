class CreateEventInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :event_invitations do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :event_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
