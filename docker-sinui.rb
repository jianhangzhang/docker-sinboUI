require 'sinatra'
require 'sinatra/reloader'
require 'http'
require 'json'

HOST='http://10.1.2.11:4243'

helpers do
  def delete_a_container(container_id)
    HTTP.delete HOST+"/containers/#{container_id}"
  end
end

get '/' do
  erb :home
end

get '/images' do
  conn = HTTP.get HOST + '/images/json'
  resp = conn.body.readpartial
  @resp_json = JSON.parse(resp)
  erb :images
end

get '/containers' do
  conn = HTTP.get HOST + '/containers/json?all=1'
  resp = conn.body.readpartial
  @resp_json = JSON.parse(resp)
  erb :containers
end

get '/containers/delete' do
  delete_a_container(x)
end

get '/create_a_container' do
  erb :create_a_container
end

post '/create_a_container' do
  conn = HTTP.get HOST + '/containers/create'
end