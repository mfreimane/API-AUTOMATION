Feature: Blog feature
  This feature is used to test the blog functionality

  Scenario: Create blog record
    Given I have logged in as a regular userr
    Then I create new blog post
#    And I check if I created blog post

  Scenario: Update blog post
    Given I have logged in as a regular userr
    Then I create new blog post
    And I update blog post title