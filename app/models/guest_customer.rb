class GuestCustomer
  require "securerandom"
  def  initialize(id)
    @id = id
  end

  # This tells you if current_customer is a registered customer or guest.
  def registered?
    false
  end

  def points
    []
  end

  def id
    @id
  end

  def get_cart
    Cart.find_or_create_by(guest_id: @id.to_s)
  end
end
