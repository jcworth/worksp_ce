class AddCoordinatesToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :latitude, :float
    add_column :meetings, :longitude, :float
  end
end
