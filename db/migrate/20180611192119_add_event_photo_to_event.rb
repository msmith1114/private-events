class AddEventPhotoToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_photo, :string
  end
end
