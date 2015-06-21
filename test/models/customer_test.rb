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
                            service_type: "Full service")
  end
  
  test "should be valid" do
    assert @customer.valid?
  end
  
  # test "name should be present" do
  #   @customer.name = "     "
  #   assert_not @customer.valid? 
  # end
  
  # test "contact number must be present" do
  #   @customer.contact_number = "      "
  #   assert_not @customer.valid?
  # end
  
  # test "car model must be present" do
  #   @customer.car_model = "      "
  #   assert_not @customer.valid?
  # end
  
  # test "car registration number must be present" do
  #   @customer.car_reg_number = "       "
  #   assert_not @customer.valid?
  # end
  
  # test "type of service must be available" do
  #   @customer.type_of_service = "      "
  #   assert_not @customer.valid?
  # end
end
