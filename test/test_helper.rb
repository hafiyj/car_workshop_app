ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  # Returns true if a test workshop is logged in.
  def is_logged_in?
    !session[:workshop_id].nil?
  end

  # Log In a test workshop
  def log_in_as(workshop, options = {})
    password    = options[:password]    || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: { email:       workshop.email,
                                  password:    password,
                                  remember_me: remember_me }
    else
      session[:workshop_id] = workshop.id
    end
  end

  private

    # Returns true inside an intergration test
    def integration_test?
      defined?(post_via_redirect)
    end

end
