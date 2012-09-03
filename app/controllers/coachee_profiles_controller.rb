class CoacheeProfilesController < InheritedResources::Base
    before_filter :authenticate_user!
	def index
		@coachee_profile = CoacheeProfile.find_by_user_id(current_user.id)
	end
end

