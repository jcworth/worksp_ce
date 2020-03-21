class AddHostToMeeting < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :host, :bigint
  end
end
