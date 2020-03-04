class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :location
      t.date :date

      t.timestamps
    end
  end
end
