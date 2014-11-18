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
  @data = container_inspect(params[:container_id])
  erb :'containers/containers_show', :layout => :_header
end

get '/containers/delete' do
  delete_a_container(x)
end
