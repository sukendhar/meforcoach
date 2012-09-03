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

def facebook
   omniauth = OmniAuth.config.mock_auth[:facebook]
   @user = find_for_facebook_oauth(omniauth)
end

def find_for_facebook_oauth(access_token)
  data = access_token["extra"]["raw_info"]
  if user = User.find_by_email(data["email"])
    user
  else
    FactoryGirl.create(:user, email: data["email"]) 
  end
end


Given /^I am not logged\-in to Facebook$/ do
  visit '/users/sign_out'
end

Given /^I choose to sign\-in using Facebook$/ do
  set_omniauth
  visit '/auth/facebook'
end

When /^I enter a valid Facebook Credentials$/ do
  set_omniauth
end

Then /^I see a success message from Facebook$/ do
  visit "/auth/facebook"
  page.should have_content "You are now signed in with your Facebook account."
end

Then /^I see a Coachee Profile Creation Form$/ do
  visit "/coachee_profiles/new"
end

When /^I submit the form, I see message, Coachee Profile created successfully$/ do
  click_button "Save"
end

Then /^I see my Coachee home page$/ do
  visit "/"
  page.should have_content "Home" 
end

# Todo
Given /^I have a Coachee account$/ do
  
end

Given /^I choose to sign in using Facebook$/ do
  set_omniauth
  visit '/auth/facebook'
end

When /^I enter a valid Facebook id$/ do
  set_omniauth
end

When /^I enter a valid Facebook password$/ do
  set_omniauth
end

Then /^Facebook authorizes me as a valid user$/ do
  visit "/auth/facebook"
  page.should have_content "You are now signed in with your Facebook account."
end