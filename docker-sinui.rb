require 'sinatra'
require 'sinatra/reloader'
require 'http'
require 'json'

URL='http://10.1.2.11:4243'

get '/' do
  erb :home
end

get '/images' do
  conn = HTTP.get URL + '/images/json'
  resp = conn.body.readpartial
  @resp_json = JSON.parse(resp)
  erb :images
end

get '/containers' do
  conn = HTTP.get URL + '/containers/json?all=1'
  resp = conn.body.readpartial
  @resp_json = JSON.parse(resp)
  erb :containers
end