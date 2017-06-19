require 'json'
require_relative '../teams/service'

class App < Sinatra::Base
  post '/teams/add' do
    team_data = JSON.parse(request.body.read)
    team_name = team_data['name']
    result = Teams::Service.add(team_name)
    result.to_json
  end

  post '/teams/list' do
    result = Teams::Service.list
    result.to_json
  end

  post '/team/retrieve' do
    team_data = JSON.parse(request.body.read)
    team_name = team_data['name']
    result = Teams::Service.retrieve(team_name)
    result.to_json
  end
end
