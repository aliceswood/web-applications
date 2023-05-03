require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  get '/hello' do
    name = params[:name]

    return "Hello #{name}!"
  end

  get '/names' do
    names = params[:names]
    return "#{names}"
  end

  post '/sort-names' do
    names = params[:names]
    sorted_names = names.split(',').sort.join(',')
    return "#{sorted_names}"
  end

  get '/' do
    @name = params[:name]

    @cohort_name = 'April 2023'

    return erb(:index)
  end
end
