require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @customer = Customer.new(name: "Customer Number 1",
                            contact_number: "0123456789",
                            car_model: "Exora",
                            car_reg_number: "WOW123",
                            service_type: "major/minor")
  end
  
  test "should be valid" do
    assert @customer.valid?
  end
  
  test "name should be present" do
    @customer.name = "     "
    assert_not @customer.valid? 
  end
  
  test "contact number must be present" do
    @customer.contact_number = "      "
    assert_not @customer.valid?
  end
  
  test "car model must be present" do
    @customer.car_model = "      "
    assert_not @customer.valid?
  end
  
  test "car registration number must be present" do
    @customer.car_reg_number = "       "
    assert_not @customer.valid?
  end
  
  test "name should not be too long" do
    @customer.name = "a" * 51
    assert_not @customer.valid? 
  end
  
  test "contact number should be max 12" do
    @customer.contact_number = "a"*13
    assert_not @customer.valid?
  end
  
  test "contact number should be unique" do
    duplicate_customer = @customer.dup
    @customer.save
    assert_not duplicate_customer.valid?
  end
  
  test "should reject invalid phone number" do
    invalid_phone_number = %w[012-3g52052 a12-3456014 +1491239123]
    invalid_phone_number.each do |phone_num|
      @customer.contact_number = phone_num
      assert_not @customer.valid?, "#{phone_num} should be invalid."
    end
  end
  
  test "should accept valid phone number" do
    valid_phone_number = %w[0123456789]
    valid_phone_number.each do |phone_num|
      @customer.contact_number = phone_num
      assert @customer.valid?, "#{phone_num} should be valid."
    end
  end
  
end
