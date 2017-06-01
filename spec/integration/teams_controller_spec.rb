require 'rack/test'
require 'json'
require_relative '../../app'

describe 'Teams controller', :wip do
  include Rack::Test::Methods

  it 'adds a team' do
    team_name = 'Some Team'
    payload = { 'name' => team_name }.to_json

    post '/teams/add', payload

    result = parse_response['name']
    expect(result).to eq(team_name)
  end

  def app
    App.new
  end

  def parse_response
    JSON.parse(last_response.body)
  end
end
