Given(/^I have logged in as a regular userr$/) do
  @user = User.new('madara1@test.com', 'parole123')
  login_as_a_regular_user(@user)
end

Then(/^I create new blog post$/) do
  @post = Post.new('update_content', 'update_title')
  # create_new_blog(@user)
  create_new_blog_post(@user)
end

# And(/^I check if I created blog post$/)do
#   check_if_i_created_blog_post(@user)
# end

And(/^I update blog post title$/) do
  # @post = Post.new('update_content', 'update_title')
  update_blog_post_title(@post, @user)
end