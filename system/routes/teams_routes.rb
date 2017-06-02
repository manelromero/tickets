require 'json'
require_relative '../teams/service'

class App < Sinatra::Base
  post '/teams/add' do
    team_data = JSON.parse(request.body.read)
    result = Teams::Service.add(team_data)
    result.to_json
  end

  post '/teams/list' do
    result = Teams::Service.list
    result.to_json
  end
end
