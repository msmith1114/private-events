class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.date :date

      t.timestamps
      t.integer  "creator_id"
    end
  end
end
