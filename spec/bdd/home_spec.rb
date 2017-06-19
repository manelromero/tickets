require 'spec_helper'
require_relative 'test-support/home'

feature 'Home page' do
  scenario 'opens' do
    current = Page::Home.new
    expect(current).to be_a Page::Home
  end
end
