require 'sinatra/base'

class App < Sinatra::Base
  set :public_folder, 'public'

  get '/' do
    File.read(File.join('public', 'index.html'))
  end

  get '/teams' do
    File.read(File.join('public', 'teams.html'))
  end
end
