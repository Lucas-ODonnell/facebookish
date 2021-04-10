class RemoveSchoolFromProfile < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :school, :text
  end
end
