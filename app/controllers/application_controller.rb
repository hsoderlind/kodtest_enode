class ApplicationController < ActionController::API
  require "jwt"
  before_action :set_current_customer

  private
    def get_guest_uuid
      request.remote_ip
    end

    def set_current_customer
      header = request.headers["Authorization"]
      token = header.split(" ").last if header
      token_decoded = JWT.decode(token, Rails.application.secret_key_base)[0] if token
      if token_decoded && token_decoded[:customer_id]
        @current_customer = Customer.find(token_decoded[:customer_id])
      else
        @current_customer = GuestCustomer.new(get_guest_uuid)
      end
    end
end
