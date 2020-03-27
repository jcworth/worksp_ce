class AddGooglePlaceIdToMeeting < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :google_place_id, :string
  end
end
