require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @workshop = workshops(:workshop1)
    remember(@workshop)
  end

  test "current_workshop returns right workshop when session is nil" do
    assert_equal @workshop, current_workshop
    assert is_logged_in?
  end

  test "current_workshop returns nil when remember digest is wrong" do
    @workshop.update_attribute(:remember_digest, Workshop.digest(Workshop.new_token))
    assert_nil current_workshop
  end
end
