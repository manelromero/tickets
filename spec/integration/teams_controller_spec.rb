require 'rack/test'
require 'json'
require_relative '../../app'
require_relative '../../system/teams/repository'

describe 'Teams controller' do
  include Rack::Test::Methods

  before(:each) { Teams::Repository.flush }

  it 'adds a team' do
    team_name = 'Some team'
    payload = { name: team_name }.to_json
    post '/teams/add', payload

    post '/team/retrieve', payload

    result = parse_response['name']
    expect(result).to eq(team_name)
  end

  it 'does not add duplicated team' do
    team_name = 'Some team'
    payload = { 'name' => team_name }.to_json
    post '/teams/add', payload
    post '/teams/add', payload

    result = parse_response['success']

    expect(result).to be false
  end

  it 'retrieves the team list' do
    payload = { 'name' => 'Some team' }.to_json
    post '/teams/add', payload

    post '/teams/list'

    result = parse_response
    expect(result.any?).to be true
  end
end

def app
  App.new
end

def parse_response
  JSON.parse(last_response.body)
end
