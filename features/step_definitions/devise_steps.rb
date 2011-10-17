Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I have one\s+user "([^\"]*)" with email "([^\"]*)" and password "([^\"]*)"$/ do |name, email, password|
  User.new(:name => name, 
           :email => email,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am a new, authenticated user$/ do
  name = 'Testing Man'
  email = 'testing@man.net'
  password = 'secretpass'

  Given %{I have one user "#{name}" with email "#{email}" and password "#{password}"}
  And %{I login with email "#{email}" and password "#{password}"}
end

Given /^I login with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  fill_in 'Email', :with => email
  fill_in 'Password', :with => password
end

When /^I register as "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^"([^"]*)" as my email address$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^"([^"]*)" as my password$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^"([^"]*)" as my password confirmation$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I press "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I want to edit my account$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the account initialization form$/ do
  pending # express the regexp above with the code you wish you had
end
