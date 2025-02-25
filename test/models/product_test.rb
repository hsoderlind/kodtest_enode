require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "product name must be Robin Hood" do
    product = products(:rh)
    assert_equal "Robin Hood", product.name
  end
end
