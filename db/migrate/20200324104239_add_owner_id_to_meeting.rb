class AddOwnerIdToMeeting < ActiveRecord::Migration[6.0]
  def change
    add_reference :meetings, :owner, foreign_key: { to_table: :users }
  end
end
