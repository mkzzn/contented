Given /^I am logged in as user "([^"]*)"$/ do |email|
  Given %{confirmed user with email "#{email}" and password "multipass"}
  And %{I am on the user sign-in page}
  And %{I sign in with email "#{email}" and password "multipass"}
  And %{I should see that I am signed in as user "#{email}"}
end

Given /^I click the sign out link/ do
  find(:xpath, "//a[contains(.,'Sign Out')]").click
end
