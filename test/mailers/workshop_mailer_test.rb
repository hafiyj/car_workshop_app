require 'test_helper'

class WorkshopMailerTest < ActionMailer::TestCase
  test "account_activation" do
    workshop = workshops(:workshop1)
    workshop.activation_token = Workshop.new_token
    mail = WorkshopMailer.account_activation(workshop)
    assert_equal "Account activation", mail.subject
    assert_equal [workshop.email], mail.to
    assert_equal ["noreply@example.com"],     mail.from
    assert_match workshop.name,               mail.body.encoded
    assert_match workshop.activation_token,   mail.body.encoded
    assert_match CGI::escape(workshop.email), mail.body.encoded
  end

  test "password_reset" do
    workshop = workshops(:workshop1)
    workshop.reset_token = Workshop.new_token
    mail = WorkshopMailer.password_reset(workshop)
    assert_equal "Password reset", mail.subject
    assert_equal [workshop.email], mail.to
    assert_equal ["noreply@example.com"],     mail.from
    assert_match workshop.reset_token,        mail.body.encoded
    assert_match CGI::escape(workshop.email), mail.body.encoded
  end
end
