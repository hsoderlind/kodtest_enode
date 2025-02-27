class CartsController < ApplicationController
  require "securerandom"
  def create
    @cart = Cart.new(guest_id: SecureRandom.uuid.to_s)
    if @cart.save
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end
end
