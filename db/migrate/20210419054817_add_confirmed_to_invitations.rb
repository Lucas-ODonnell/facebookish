class AddConfirmedToInvitations < ActiveRecord::Migration[6.0]
  def change
    add_column :invitations, :confirmed, :boolean
  end
end
