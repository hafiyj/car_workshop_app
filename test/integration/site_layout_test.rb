
class SiteLayoutTest < ActionDispatch::IntegrationTest

    def setup
      @workshop = workshops(:workshop1)
    end

    test "layout links" do
        get root_path
        assert_template 'landing_pages/home'
        assert_select "a[href=?]", root_path, count: 2
        assert_select "a[href=?]", help_path
        assert_select "a[href=?]", about_path
        assert_select "a[href=?]", contact_path

        get signup_path

    assert_select "title", full_title("Sign up")

    assert_select "a[href=?]", signup_path
    end

    test "logged in layout links" do
      get login_path
      assert_template 'sessions/new'

      assert_select "a[href=?]", login_path
      log_in_as(@workshop)
      get root_path
      assert_select "a[href=?]", root_path, count: 2
      assert_select "a[href=?]", login_path, count: 0
      assert_select "a[href=?]", logout_path
    end
end
