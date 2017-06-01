require 'json'
require_relative '../teams/service'

class App < Sinatra::Base
  post '/teams/add' do
    payload = JSON.parse(request.body.read)
    name = payload['name']
    result = Teams::Service.add(name)
    result.to_json
  end
end
