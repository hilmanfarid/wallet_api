class SessionController < ApplicationController
  include Errors
  include Encryptor
  # POST /login
  def login
    begin
      user = User.find_by(username: params[:username])
      encrypted_password = Encryptor.encrypt(params[:password], user.secret)
      if encrypted_password != user.crypted_password
        raise Errors::UnauthorizedError
      end

      token = AccessToken.new(user.id)
      access_token = token.generate(user.secret)
      user.token = access_token
      user.save!
    rescue StandardError => e

      raise Errors::UnauthorizedError
    end

    render html: access_token
  end
end
