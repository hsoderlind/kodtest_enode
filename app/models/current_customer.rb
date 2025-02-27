class CurrentCustomer
  required "jwt"
  require "securerandom"

  def self.customer(token)
    return GuestCustomer.new(SecureRandom.uuid) unless token

    token_decoded = JWT.decode(token, Rails.application.secret_key_base)[0]
    if token_decoded[:customer_id]
      Customer.find(token_decoded[:customer_id])
    else
      GuestCustomer.new(token_decoded[:guest_id])
    end
  end
end
