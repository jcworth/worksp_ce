class AddMessageToAttendee < ActiveRecord::Migration[6.0]
  def change
    add_column :attendees, :message, :text
  end
end
