class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :job
      t.text :school
      t.text :phone
      t.text :email
      t.text :location
      t.text :website
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
