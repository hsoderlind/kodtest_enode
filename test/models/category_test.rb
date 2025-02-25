require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "should not save category without name" do
    category = Category.new
    assert_not category.save
  end

  test "should save category with name" do
    category = Category.new(name: "Nya utgåvor")
    assert category.save
  end
end
