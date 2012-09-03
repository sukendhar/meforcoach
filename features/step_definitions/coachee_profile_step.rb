def set_omniauth(opts = {})
  default = {:provider => :facebook,
             :uuid     => "100002702856241",
             :facebook => {
                            :email => "example@example.com",
                            :first_name => "Tester",
                            :last_name => "Tester",
                            :gender => "Male",
                            :location => {"name"=>"Tester"},
                            :languages => [{"name"=>"Hindi"},{"name"=>"English"}],
                            :username => "Tester",
                            :id => "100002702856241"
                          }
            }

  credentials = default.merge(opts)
  provider = credentials[:provider]
  user_hash = credentials[provider]

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[provider] = {
    'uid' => credentials[:uuid],
    "extra" => {
    "raw_info" => {
      "email" => user_hash[:email],
      "first_name" => user_hash[:first_name],
      "last_name" => user_hash[:last_name],
      "gender" => user_hash[:gender],
      "location" => user_hash[:location],
      "languages" => user_hash[:languages],
      "username" => user_hash[:username],
      "id" => user_hash[:id]
      }
    }
  }
end

def user_profile
  @user_profile = OmniAuth.config.mock_auth[:facebook]["extra"]["raw_info"]
end

def coachee_profile
  @coachee_profile ||=    {
                            :name => "Tester",
                            :gender => "Male",
                            :location => "India",
                            :language => "Hindi",
                            :age => "18-20"
                          }
end

Given /^I have signed in with Facebook$/ do
  set_omniauth
  visit "/auth/facebook"
end

Then /^I given permission for the system to retrieve my Facebook profile information$/ do
  visit "/auth/facebook"
end

Then /^I see the new Profile page$/ do
  visit "/auth/facebook"
  page.should have_content "Coach Profile"
end

Then /^I see my name on the page$/ do
  user_profile
  visit "/auth/facebook"
  page.should have_content "#{@user_profile["first_name"]} #{@user_profile["last_name"]}"
end

Then /^I see my language is populated from my Facebook profile$/ do
  user_profile
  visit "/auth/facebook"
  language = nil
  @user_profile["languages"].each do |f|
    language = language.nil? ? f["name"] : (language + "," + f["name"])
  end
  page.should have_content language
end

Then /^I see my age is populated from my Facebook profile$/ do
  user_profile
  visit "/auth/facebook"
  page.should have_content "Age:"
end

Then /^I see my country is populated from my Facebook profile$/ do
  user_profile
  visit "/auth/facebook"
  page.should have_content @user_profile["location"]["name"]
end


# Todo

When /^I choose Next$/ do
  
end

Then /^I see the describe issue page$/ do
  
end

Given /^I have signed in with my email address and password$/ do
  set_omniauth
  visit "/auth/facebook"
end

Given /^I have not created a Profile$/ do
  visit "/"
end

When /^I choose <(\d+) as my age$/ do |arg1|
  coachee_profile
  @coachee_profile = @coachee_profile.merge(:age => "25")
end

When /^I choose Male as my gender$/ do
  coachee_profile
  @coachee_profile = @coachee_profile.merge(:gender => "Male")
end

When /^I choose South Africa as my location$/ do
  coachee_profile
  @coachee_profile = @coachee_profile.merge(:location => "South Africa")
end

When /^I choose English as my preferred language$/ do
  coachee_profile
  @coachee_profile = @coachee_profile.merge(:language => "English")
end

When /^I choose (\d+)\-(\d+) as my age$/ do |arg1, arg2|
  coachee_profile
  @coachee_profile = @coachee_profile.merge(:age => "30-35")
end

When /^I choose Female as my gender$/ do
  coachee_profile
  @coachee_profile = @coachee_profile.merge(:gender => "Female")
end

When /^I choose India as my location$/ do
  coachee_profile
  @coachee_profile = @coachee_profile.merge(:location => "India")
end

When /^I choose Hindi as my preferred language$/ do
  coachee_profile
  @coachee_profile = @coachee_profile.merge(:language => "Hindi")
end

When /^I choose Afghanistan as my location$/ do
  coachee_profile
  @coachee_profile = @coachee_profile.merge(:location => "Afghanistan")
end

When /^I choose Urdu as my preferred language$/ do
  coachee_profile
  @coachee_profile = @coachee_profile.merge(:language => "Urdu")
end

# Todo
Then /^I have not given permission for the system to retrieve my Facebook profile information$/ do
  
end

Then /^I correctly complete the Coachee Profile form$/ do
  visit "/"
end