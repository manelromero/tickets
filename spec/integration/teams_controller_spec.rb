require 'rack/test'
require 'json'
require_relative '../../app'
require_relative '../../system/teams/repository'

describe 'Teams controller', :wip do
  include Rack::Test::Methods

  before(:each) { Teams::Repository.flush }

  it 'adds a team' do
    add_team('Some team')

    payload = { name: 'Some team' }.to_json
    post '/team/retrieve', payload

    result = parse_response['name']
    expect(result).to eq('Some team')
  end

  it 'does not add duplicated team' do
    add_team('Some team')
    add_team('Some team')

    result = parse_response['success']

    expect(result).to be false
  end

  it 'retrieves the team list in alphabetical order' do
    add_team('Second team')
    add_team('First team')

    post '/teams/list'
    first_result = parse_response[0]['name']
    second_result = parse_response[1]['name']

    expect(first_result).to eq('First team')
    expect(second_result).to eq('Second team')
  end
end

def app
  App.new
end

def add_team(name)
  payload = { name: name }.to_json
  post '/teams/add', payload
end

def parse_response
  JSON.parse(last_response.body)
end
