# frozen_string_literal: true

module Encryptor
  module_function

  def encrypt(data, secret)
    digest = OpenSSL::Digest.new("sha256")
    OpenSSL::HMAC.hexdigest(digest, secret, data)
  end
end
