class RemoveDateInMeeting < ActiveRecord::Migration[5.2]
  def change
    remove_column :meetings, :date
  end
end
