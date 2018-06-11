class AddCityAndStateToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :city, :string
    add_column :users, :state_code, :string
  end
end
