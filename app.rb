require 'sinatra/base'
require_relative 'system/routes/teams_routes'

class App < Sinatra::Base
  set :public_folder, 'public'

  get '/' do
    File.read(File.join('public', 'index.html'))
  end

  get '/teams' do
    File.read(File.join('public', 'teams.html'))
  end
end
