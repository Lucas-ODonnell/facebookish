class RemoveConfirmedFromInvitations < ActiveRecord::Migration[6.0]
  def change
    remove_column :invitations, :confirmed, :boolean
  end
end
