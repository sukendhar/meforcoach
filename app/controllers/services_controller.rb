class ServicesController < ApplicationController
	before_filter :authenticate_user!, :except => [:create,:linkedin,:linkedin_callback,:ask_email,:add_email]
  skip_before_filter :verify_authenticity_token or protect_from_forgery :except => :create

  def destroy
    # remove an authentication service linked to the current user
    @service = current_user.services.find(params[:id])
    @service.destroy

    redirect_to root_path
  end


  def create
    # get the service parameter from the Rails router
    params[:service] ? service_route = params[:service] : service_route = 'no service (invalid callback)'

    # get the full hash from omniauth
    omniauth = request.env['omniauth.auth']

    # continue only if hash and parameter exist
    if omniauth and params[:service]
      # map the returned hashes to our variables first - the hashes differ for every service
      if service_route == 'facebook'

        omniauth['extra']['raw_info']['email'] ? email = omniauth['extra']['raw_info']['email'] : email = ''
        omniauth['extra']['raw_info']['first_name'] ? first_name = omniauth['extra']['raw_info']['first_name'] : first_name = ''
        omniauth['extra']['raw_info']['last_name'] ? last_name = omniauth['extra']['raw_info']['last_name'] : last_name = ''
        omniauth['extra']['raw_info']['gender'] ? gender = omniauth['extra']['raw_info']['gender'] : gender = ''
        omniauth['extra']['raw_info']['location']['name'] ? location = omniauth['extra']['raw_info']['location']['name'] : location = ''
        omniauth['extra']['raw_info']['languages'] ? languages = omniauth['extra']['raw_info']['languages'] : languages = ''
        omniauth['extra']['raw_info']['username'] ? username = omniauth['extra']['raw_info']['username'] : username = ''
        omniauth['extra']['raw_info']['id'] ? uid = omniauth['extra']['raw_info']['id'] : uid = ''
        omniauth['provider'] ? provider = omniauth['provider'] : provider = ''
        
        language = nil
        languages.each do |f|
          language = language.nil? ? f["name"] : (language + "," + f["name"])
        end

        @user = User.find_by_email(email)
        if @user.nil?
          @user = User.new :name=>"#{first_name} #{last_name}", :email => email, :password => SecureRandom.hex(10)
          @user.save!

          @cachee = CoacheeProfile.new :name=> "#{first_name} #{last_name}", :gender=> gender, :location=> location, :language=> language, :user_id=> @user.id
          @cachee.save! 

        end
        sign_in(:user, @user)
        flash[:notice]="You are now signed in with your Facebook account."
        redirect_to "/coachee_profiles"
      else
        render :text => omniauth.to_yaml
        return
      end
      end
           
  end
end
