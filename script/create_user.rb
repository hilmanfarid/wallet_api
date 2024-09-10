class RegisterUser
  def initialize(username, password)
    @username = username
    @password = password
  end

  def register
    hash = SecureRandom.hex(3) + Time.now.to_s
    base64hash = Base64.strict_encode64(hash)
    user = User.new

    user.username = @username
    user.crypted_password = generate_password(@password, base64hash)
    user.secret = base64hash
    user.status = 1

    user.save

    account = Account.new(user_id: user.id, account_number: 16.times.map { rand(10) }.join, account_name: user.username)
    account.save
  end

  def generate_password(password, secret)
    digest = OpenSSL::Digest.new('sha256')
    OpenSSL::HMAC.hexdigest(digest, secret, password)
  end
end