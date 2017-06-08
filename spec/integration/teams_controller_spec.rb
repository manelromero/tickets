require 'rack/test'
require 'json'
require_relative '../../app'
require_relative '../../system/teams/repository'

Mongo::Logger.logger.level = ::Logger::INFO

describe 'Teams controller' do
  include Rack::Test::Methods

  before(:each) { TestRepository.flush }

  it 'adds a team' do
    team_name = 'Some team'
    payload = { 'name' => team_name }.to_json
    post '/teams/add', payload

    post '/team/retrieve', payload

    result = parse_response['name']
    expect(result).to eq(team_name)
  end

  it 'does not add repeated team', :wip do
    team_name = 'Some team'
    payload = { 'name' => team_name }.to_json
    post '/teams/add', payload
    post '/teams/add', payload

    result = parse_response['success']

    expect(result).to be false
  end

  it 'retrieves the team list' do
    add_team('Some team')
    add_team('Some other team')

    post '/teams/list'

    result = parse_response
    expect(result.any?).to be true
  end
end

class TestRepository < Teams::Repository
  def self.flush
    collection.delete_many
  end
end

def app
  App.new
end

def parse_response
  JSON.parse(last_response.body)
end
