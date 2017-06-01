require 'spec_helper'
require_relative 'test-support/teams'

feature 'Teams page' do
  scenario 'opens' do
    current =  Page::Teams.new
    expect(current).to be_a Page::Teams
  end
end
