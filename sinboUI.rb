require 'sinatra'
require 'sinatra/reloader'
require 'http'
require 'json'

load 'routes/containers.rb'
load 'routes/images.rb'

load 'helpers/Containers_helpers.rb'
load 'helpers/Images_helpers.rb'

helpers ContainersHelpers, ImagesHelpers

HOST='http://10.1.2.11:4243'

get '/' do
  erb :home, :layout => :_header
end
