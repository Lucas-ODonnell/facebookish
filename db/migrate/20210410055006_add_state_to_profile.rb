class AddStateToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :state, :text
    add_column :profiles, :city, :text
    add_column :profiles, :country, :text
    add_column :profiles, :zipcode, :text
    add_column :profiles, :father, :text
    add_column :profiles, :mother, :text
    add_column :profiles, :brothers, :text
    add_column :profiles, :sisters, :text
    add_column :profiles, :hometown, :text
    add_column :profiles, :gender, :text
    add_column :profiles, :birthday, :text
    add_column :profiles, :language, :text
    add_column :profiles, :bio, :text
    add_column :profiles, :highschool, :text
    add_column :profiles, :college, :text
  end
end
