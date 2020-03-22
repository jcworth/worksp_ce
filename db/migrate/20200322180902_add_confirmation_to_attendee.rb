class AddConfirmationToAttendee < ActiveRecord::Migration[6.0]
  def change
    add_column :attendees, :confirmed, :boolean
  end
end
