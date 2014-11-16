require 'sinatra'
require 'sinatra/reloader'
require 'http'
require 'json'

HOST='http://10.1.2.11:4243'

helpers do
  def container_inspect(id)
    conn = HTTP.get HOST+"/containers/#{id}/json"
    resp = conn.body.readpartial
    JSON.parse(resp)
  end

  def container_delete(id)
    HTTP.delete HOST+"/containers/#{id}"
  end

  def image_inspect(name)
    conn = HTTP.get HOST+"/images/#{name}/json"
    resp = conn.body.readpartial
    JSON.parse(resp)
  end
end

#####
get '/' do
  erb :home, :layout => :_header
end

get '/containers' do
  conn = HTTP.get HOST + '/containers/json?all=1'
  resp = conn.body.readpartial
  @data = JSON.parse(resp)
  erb :containers, :layout => :_header
end

get '/containers/show' do
  @data = container_inspect(params[:container_id])
  erb :containers_show, :layout => :_header
end

get '/containers/delete' do
  delete_a_container(x)
end

get '/images' do
  conn = HTTP.get HOST + '/images/json'
  resp = conn.body.readpartial
  @data = JSON.parse(resp)
  erb :images, :layout => :_header
end

get '/images/show' do
  @data = image_inspect(params[:image_name])
  erb :images_show, :layout => :_header
end
#####