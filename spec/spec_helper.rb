require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require_relative '../app'

SINATRA_PORT = '4567'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_driver = :chrome
Capybara.app_host = "http://localhost:#{SINATRA_PORT}"
Capybara.default_max_wait_time = 0
