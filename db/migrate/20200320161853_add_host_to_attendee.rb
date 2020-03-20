class AddHostToAttendee < ActiveRecord::Migration[6.0]
  def change
    add_column :attendees, :host, :boolean, null: false, default: false
  end
end
