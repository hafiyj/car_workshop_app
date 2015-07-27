require 'test_helper'

class WorkshopsIndexTest < ActionDispatch::IntegrationTest

  def setup
    @workshop  = workshops(:workshop1)
    @admin     = workshops(:workshop1)
    @non_admin = workshops(:workshop2)
  end

  test "index including pagination" do
    log_in_as(@workshop)
    get workshops_path
    assert_template 'workshops/index'
    assert_select 'div.pagination'
    Workshop.paginate(page: 1).each do |workshop|
      assert_select 'a[href=?]', edit_workshop_path(workshop), text: "Edit"
    end
  end

  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get workshops_path
    assert_template 'workshops/index'
    assert_select 'div.pagination'
    first_page_of_workshops = Workshop.paginate(page: 1)
    first_page_of_workshops.each do |workshop|
      assert_select 'a[href=?]', edit_workshop_path(workshop), text: "Edit"
      unless workshop == @admin
        assert_select 'a[href=?]', workshop_path(workshop), text: "Delete"
      end
    end
    assert_difference 'Workshop.count', -1 do
      delete workshop_path(@non_admin)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get workshops_path
    assert_select 'a', text: 'Delete', count: 0
  end
end
