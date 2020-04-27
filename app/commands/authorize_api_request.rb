# app/commands/authorize_api_request.rb

class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  attr_reader :headers

  def user
    if decoded_auth_token.nil?
      errors.add(:token, 'Invalid token')
    else
      @user ||= User.find(decoded_auth_token[:user_id])
      if @user.nil?
        User.create!(id: @decoded_auth_token[:user_id],
                     username: @decoded_auth_token[:name],
                     photo_profile: @decoded_auth_token[:picture])
      end
    end
  end

  def decoded_auth_token
    @decoded_auth_token ||= FirebaseIdToken::Signature.verify(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      errors.add :token, 'Missing token'
    end
    nil
  end
end