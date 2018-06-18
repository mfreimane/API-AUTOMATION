# require 'rest-client'

Then(/^I have access to my profile information$/)do
    # puts @user.auth_token
  check_profile_info(@user)
  end
