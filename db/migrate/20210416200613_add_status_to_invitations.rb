class AddStatusToInvitations < ActiveRecord::Migration[6.0]
  def change
    add_column :invitations, :status, :bigint, default: 0
  end
end
