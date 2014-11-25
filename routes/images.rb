get '/images' do
  @data = images_list
  erb :'images/images', :layout => :_header
end

get '/images/show' do
  @data = image_show(params[:image_name])
  erb :'images/images_show', :layout => :_header
end

get '/images/history' do
  @data = image_history(params[:image_name])
  erb :'images/images_history', :layout => :_header
end

get '/images/delete' do
#  puts params
#  image_delete(params[:image_name])
  redirect :'/images'
end