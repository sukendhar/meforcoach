

Given /^I have created a Coachee profile$/ do
  set_omniauth
  visit "/auth/facebook"
end

Given /^I have not yet described my Coaching Issue$/ do
  visit "/"
end

Given /^I am on my Coachee home page$/ do
  visit "/"
end

Then /^I see an option to create my Coaching Issue$/ do
  
end

When /^I choose to describe my Coaching Issue$/ do
 
end

Then /^I see the New Coaching Issue page$/ do
 
end

When /^I correctly complete the New Coaching Issue form$/ do
 
end

Then /^I see a message confirming that I have created a Coaching Issue$/ do
 
end

Then /^I see the define communication modes page$/ do
 
end

When /^I choose to cancel the New Coaching issue process$/ do
 
end

Then /^So I am on my Coachee home page$/ do
 
end
