require 'sinatra'
require 'sinatra/reloader'
require 'http'
require 'json'

load 'routes/containers.rb'
load 'routes/images.rb'

HOST='http://10.1.2.11:4243'

helpers do
  def container_list(num)
    # num = 0, list Up containers
    # num = 1, list all containers
    conn  = HTTP.get HOST + "/containers/json?all=#{num}"
    resp = conn.body.readpartial
    JSON.parse(resp)
  end

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

get '/' do
  erb :home, :layout => :_header
end
