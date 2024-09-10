class AccessToken
  include Encryptor

  def initialize(user_id, expired = nil)
    @user_id = user_id
    if expired == nil
      @expired = (Time.now.to_f * 1000).to_i + (1.days.in_seconds * 1000)
    else
      @expired = expired
    end

  end

  def generate(secret)
    data = self.instance_values.to_json
    encoded_data = Base64.strict_encode64(data)
    encrypted_data = Encryptor.encrypt(data, secret)

    "#{encoded_data}.#{encrypted_data}"
  end
end
