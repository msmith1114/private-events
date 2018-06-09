class AddInviteAndStatusToInvite < ActiveRecord::Migration[5.2]
  def change
    add_column :invites, :invite_code, :string
    add_column :invites, :invite_status, :string, :default => "Pending"
  end
end
