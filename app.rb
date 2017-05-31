require 'sinatra/base'

class App < Sinatra::Base
  set :public_folder, 'public'

  get '/' do
    File.read(File.join('public', 'index.html'))
  end
end
