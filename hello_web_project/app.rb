require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # GET /
  #  Root path (homepage, index page)
  get '/' do
    return 'Hello!'
  end

  get '/posts' do
    name = params[:name]
    cohort_name = params[:cohort_name]

    return "Hello #{name}, you are in the #{cohort_name} cohort"
  end

  post '/posts' do
    title = params[:title]
    return "Post was created with the title: #{title}"
  end

  get '/hello' do
    name = params[:name]
    return "Hello #{name}"
  end

  post '/submit' do
    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you send this message: '#{message}'"
  end
end