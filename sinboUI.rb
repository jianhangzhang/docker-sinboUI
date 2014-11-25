require 'sinatra'
require 'sinatra/reloader'
require 'http'
require 'json'

require './routes/containers.rb'
require './routes/images.rb'

require './helpers/Containers_Helpers.rb'
require './helpers/Images_Helpers.rb'

helpers ContainersHelpers, ImagesHelpers

HOST='http://10.1.2.11:4243'

get '/' do
  erb :home, :layout => :_header
end
