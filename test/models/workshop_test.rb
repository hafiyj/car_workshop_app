require 'test_helper'

class WorkshopTest < ActiveSupport::TestCase
   
  def setup
    @workshop = Workshop.new(name: "Example Workshop", email: "example@workshop.com", 
                              address: "A-31-1, Vista Komanwel D, 57000 Kuala Lumpur, WP",
                              contact_num: "038998888", com_reg_num: "R1234567890",
                              password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @workshop.valid?
  end

  # Name Test
  test "name should be present" do
    @workshop.name = "     "
    assert_not @workshop.valid?
  end
  
  test "name should not be too long" do
    @workshop.name = " " * 51
    assert_not @workshop.valid?
  end
  
  # Email Test
  test "email should be present" do
    @workshop.email = "       "
    assert_not @workshop.valid?
  end

  test "email should not be too long" do
    @workshop.email = "a" * 244 + "@example.com"
    assert_not @workshop.valid?
  end
  
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @workshop.email = mixed_case_email
    @workshop.save
    assert_equal mixed_case_email.downcase, @workshop.reload.email
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @workshop.email = valid_address
      assert @workshop.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  # Contact Test
  test "contact should be present" do
    @workshop.contact_num = "       "
    assert_not @workshop.valid?
  end
  
  test "contact should not be too long" do
    @workshop.contact_num = "a" * 12 
    assert_not @workshop.valid?
  end
  
  #Address Test
  test "address should be present" do
    @workshop.address = "         "
    assert_not @workshop.valid?
  end

  #Password Test
  test "password should have a minimum length" do
    @workshop.password = @workshop.password_confirmation = "a" * 5
    assert_not @workshop.valid?
  end
  
end
