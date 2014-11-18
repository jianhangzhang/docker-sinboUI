get '/images' do
  conn = HTTP.get HOST + '/images/json'
  resp = conn.body.readpartial
  @data = JSON.parse(resp)
  erb :'images/images', :layout => :_header
end

get '/images/show' do
  @data = image_inspect(params[:image_name])
  erb :'images/images_show', :layout => :_header
end