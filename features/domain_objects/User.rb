class User
  attr_accessor :id, :email, :firstName, :lastName, :password, :auth_token

  def initialize(email, password)
    self.email =  email
    self.password = password
  end

  # def initialize(content, title)
  #   self.content = content
  #   self.title = title
  # end

end