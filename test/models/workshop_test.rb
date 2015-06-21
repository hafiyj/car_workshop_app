require 'test_helper'

class WorkshopTest < ActiveSupport::TestCase
  
  def setup
    @workshop = Workshop.new(name: "Example Workshop", email: "user@example.com",
                              address: "A-31-1, Vista Komanwel D, 57000 Kuala Lumpur, WP",
                              contact_num: "0388889999", com_reg_num: "R123456789",
                              password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @workshop.valid?
  end

  test "name should be present" do
    @workshop.name = "     "
    assert_not @workshop.valid?
  end
  
end
