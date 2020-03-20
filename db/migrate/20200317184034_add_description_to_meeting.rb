class AddDescriptionToMeeting < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :description, :text
  end
end
