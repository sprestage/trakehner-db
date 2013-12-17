require 'coveralls'
Coveralls.wear!
require 'simplecov'
SimpleCov.start 'rails'
ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in
    visit new_user_session_path
    fill_in 'Email', with: users(:user_one).email
    fill_in 'Password', with: "password"
    click_on 'Sign in'
    page.must_have_content "Logged in as"
    page.must_have_content "Sign Out"
    page.wont_have_content "Log In"
    page.wont_have_content "Invalid email or password"
  end
  def sign_in_admin
    visit new_user_session_path
    fill_in 'Email', with: users(:admin).email
    fill_in 'Password', with: "password"
    click_on 'Sign in'
    page.must_have_content "Logged in as"
    page.must_have_content "Sign Out"
    page.wont_have_content "Log In"
    page.wont_have_content "Invalid email or password"
  end
  def sign_in_ata
    visit new_user_session_path
    fill_in 'Email', with: users(:admin).email
    fill_in 'Password', with: "password"
    click_on 'Sign in'
    page.must_have_content "Logged in as"
    page.must_have_content "Sign Out"
    page.wont_have_content "Log In"
    page.wont_have_content "Invalid email or password"
  end
end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  include Capybara::Assertions
end
