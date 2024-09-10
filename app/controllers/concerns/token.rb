# frozen_string_literal: true

module Token
  module_function
  include Errors

  def authorize(token)
    begin
      token_values = token.split(".")
      decoded_token = Base64.strict_decode64(token_values[0])
      token_user = JSON.parse(decoded_token).deep_symbolize_keys
      user = User.find(token_user[:user_id])
    rescue StandardError => e
      raise Errors::UnauthorizedError
    end


    if token_values[1] != Encryptor.encrypt(decoded_token, user.secret)
      raise Errors::UnauthorizedError
    end

    if (Time.now.to_f * 1000).to_i > token_user[:expired]
      raise Errors::UnauthorizedError.new("Token Expired")
    end

    if token != user.token
      raise Errors::UnauthorizedError.new("Invalid Token")
    end

    user
  end
end
