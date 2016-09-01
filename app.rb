require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'json'

enable :sessions

configure :development, :test do
  require 'pry'
end

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/' do
  @title = "Hello World"
  erb :index
end

post '/' do
  response = JSON.generate({
    "response_type": "in_channel",
    "text": "Chowdabot recieved a request"
  })
  return response
end
