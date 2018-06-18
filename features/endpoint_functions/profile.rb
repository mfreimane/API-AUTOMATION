require 'rest-client'

def  check_profile_info(user)
  response = API.get('http://195.13.194.180:8090/api/profile',
                     headers: {'Authorization' => user.auth_token},
                     cookies: {})
  # check if 200 OK  is received
  # assert_equal(200, response.code, "Failed to check profile information ! Response : #{response}")
  assert_status_code(200, response, "Profile check")
  response_hash = JSON.parse(response)

  # Check if id is correct
  assert_equal(user.id, response_hash['id'], 'Id is not match!')
  # Check if email is correct
  assert_equal(user.email, response_hash['email'], 'Email  is not match!')
  # Check if firstName is correct
  assert_equal(user.firstName, response_hash['firstName'], 'firstName  is not match!')

end