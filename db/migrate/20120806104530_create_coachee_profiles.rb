class CreateCoacheeProfiles < ActiveRecord::Migration
  def change
    create_table :coachee_profiles do |t|

      t.string :name
      t.string :age
      t.string :gender
      t.string :location
      t.string :phone
      t.string :timezone
      t.string :relationship_status
      t.string :available_time
      t.string :language
      t.string :privacy_setting
      t.references :user

      t.timestamps
    end
  end
end
