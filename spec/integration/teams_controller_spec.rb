require 'rack/test'
require 'json'
require_relative '../../app'
require_relative '../../system/teams/repository'

Mongo::Logger.logger.level = ::Logger::INFO

class TestRepository < Teams::Repository
  def self.flush
    collection.delete_many
  end
end

describe 'Teams controller' do
  include Rack::Test::Methods

  it 'adds a team' do
    team_name = 'Some team'
    add_team(team_name)

    payload = { 'name' => team_name }.to_json
    post '/team/retrieve', payload

    result = parse_response['name']
    expect(result).to eq(team_name)
  end

  it 'retrieves the team list' do
    TestRepository.flush
    add_team('Some team')
    add_team('Some other team')

    post '/teams/list'

    result = parse_response
    expect(result).to be_an Array
    expect(result.length).to eq(2)
  end

  def app
    App.new
  end

  def parse_response
    JSON.parse(last_response.body)
  end

  def add_team(name)
    payload = { 'name' => name }.to_json
    post '/teams/add', payload
  end
end
