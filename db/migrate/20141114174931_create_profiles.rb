class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :location
      t.date :birthdate
      t.integer :user_id
      t.string :avatar

      t.timestamps
    end
  end
end
