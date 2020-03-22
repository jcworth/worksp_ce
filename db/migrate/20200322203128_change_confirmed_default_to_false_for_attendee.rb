class ChangeConfirmedDefaultToFalseForAttendee < ActiveRecord::Migration[6.0]
  def change
    add_column :attendees, :confirmed, :boolean, default: false, null: false
  end
end
