class GuestCustomer
  def  initialize(guest_id)
    @id = guest_id
  end

  # This tells you if current_customer is a registered customer or guest.
  def registered?
    false
  end

  # def get_cart
  #   Cart.find_or_create_by(guest_id: @id)
  # end
end
