class CoacheeProfile < ActiveRecord::Base
  attr_accessible :name, :age, :location, :gender, :language, :user_id, :phone, :relationship_status, :available_time, :privacy_setting, :timezone 
  belongs_to :user
end
