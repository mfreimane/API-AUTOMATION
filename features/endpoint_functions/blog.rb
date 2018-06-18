require 'rest-client'

def login_as_a_regular_user(user)
  payload = {
      'email' => user.email,
      'password' => user.password
  }.to_json
  response = API.post('http://195.13.194.180:8090/api/login',
                      headers: {'Content-Type' => 'application/json'},
                      cookies: {},
                      payload: payload)

  #   check if 200OK is received
  assert_status_code(200, response, "Login")

  response_hash = JSON.parse(response)
  # response_hash['firstName']
  #
  # check if correct user is returned
  assert_equal(user.email, response_hash['email'], 'Logged in user is not correct!')

  user.firstName = response_hash['firstName']
  user.lastName = response_hash['lastName ']
  user.id = response_hash['id']
  user.auth_token = response.headers[:authorization]
end


def create_new_blog_post(user)
  content = 'content'
  title = 'title'
  payload = {
      'content' => 'content',
      'title' =>  'title'
  }.to_json
  response = API.post('http://195.13.194.180:8090/api/post',
                      headers: {'Authorization' => user.auth_token, 'Content-Type' => 'application/json'},
                      cookies: {},
                      payload: payload)
  assert_status_code(200, response, "Create post")
  puts response
  response_hash = JSON.parse(response)
  puts response_hash
  assert_equal(content, response_hash['content'], 'content is not correct!')
  assert_equal(title, response_hash['title'], 'content is not correct!')
end

def  update_blog_post_title(post, user)
  title = 'fgdfgdfgdf'
  payload = {
      'title' =>  'fgdfgdfgdf'
  }.to_json
  response = API.post('http://195.13.194.180:8090/api/post?id='+ post.id.to_s,
                      headers: {'Authorization' => user.auth_token, 'Content-Type' => 'application/json'},
                      cookies: {},
                      payload: payload)
  assert_status_code(200, response, "Create post")
  puts response
  response_hash = JSON.parse(response)
  post.id = response_hash['id']
  assert_equal(title, response_hash['title'], 'content is not correct!')
end

# def check_if_i_created_blog_post(user)
#   content = 'content'
#   title = 'title'
#   response = API.get('http://195.13.194.180:8090/api/post',
#                       headers: {'Authorization' => user.auth_token, 'Content-Type' => 'application/json'},
#                       cookies: {})
#
#   assert_status_code(200, response, "Profile check")
#   response_hash = JSON.parse(response)
#   assert_equal(content, response_hash['content'], 'content is not correct!')
#   assert_equal(title, response_hash['title'], 'content is not correct!')
# end


# def check_if_i_created_blog_post(user)
#   response = API.get('http://195.13.194.180:8090/api/post',
#                      headers: {'Authorization' => user.auth_token},
#                      cookies: {})
#   # check if 200 OK  is received
#   # assert_equal(200, response.code, "Failed to check profile information ! Response : #{response}")
#   assert_status_code(200, response, "Profile check")
#   response_hash = JSON.parse(response)
#
#   # Check if id is correct
#   assert_equal(user.content, response_hash['content'], 'Id is not match!')
#   # Check if email is correct
#   assert_equal(user.title, response_hash['title'], 'Email  is not match!')
#   # response = API.get('http://195.13.194.180:8090/api/post',
#   #                    headers: {'Authorization' => user.auth_token, 'Content-Type' => 'application/json'},
#   #                    cookies: {})
#   # # check if 200 OK  is received
#   # # assert_equal(200, response.code, "Failed to check profile information ! Response : #{response}")
#   # assert_status_code(200, response, "blog post check")
#   # # response_hash = JSON.parse(response)
# end

# def create_new_blog_record(user)
#   payload = {
#       'content' => user.content,
#       'title' =>  user.title
#   }.to_json
#
#   response = API.post('http://195.13.194.180:8090/api/post',
#                       headers: {'Content-Type' => 'application/json'},
#                       cookies: {},
#                       payload: payload)
#
#   assert_status_code(201, response, "Create")
#
#   response_hash = JSON.parse(response)
#   assert_equal(user.email, response_hash['content'], 'not not not!')
#   assert_equal(user.email, response_hash['title'], 'not not not!')
# end

