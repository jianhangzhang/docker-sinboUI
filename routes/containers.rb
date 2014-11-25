get '/containers' do
  @data_up = container_list(0)
  @data_all = container_list(1)
  erb :'containers/containers', :layout => :_header
end

get '/containers/up' do
  @data_up = container_list(0)
  @data_all = container_list(1)
  erb :'containers/containers_up', :layout => :_header
end

get '/containers/show' do
  @data = container_show(params[:container_id])
  erb :'containers/containers_show', :layout => :_header
end

get '/containers/start' do
  container_start(params[:container_id])
  redirect '/containers'
end

get '/containers/stop' do
  container_stop(params[:container_id])
  redirect '/containers'
end

get '/containers/restart' do
  container_restart(params[:container_id])
  redirect '/containers'
end

get '/containers/kill' do
  container_kill(params[:container_id])
  redirect '/containers'
end

get '/containers/pause' do
  container_pause(params[:container_id])
  redirect '/containers'
end

get '/containers/unpause' do
  container_unpause(params[:container_id])
  redirect '/containers'
end

get '/containers/delete' do
#  puts params
#  container_delete(params[:container_id])
  redirect '/containers'
end

get '/containers/create' do
  container_delete(params[:container_id])
  erb :'containers/containers_create', :layout => :_header
end

post '/containers/create' do
  puts params
end