class TokenGenerator
  attr_reader :email

  def initialize(email)
    @email = email
  end

  def auth_token
    secret = "#{email}:#{ENV['API_TOKEN']}"
    Base64.strict_encode64(secret)
  end
end
