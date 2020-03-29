class AddDeclinedToAttendee < ActiveRecord::Migration[6.0]
  def change
    add_column :attendees, :declined, :boolean, default: false
  end
end
