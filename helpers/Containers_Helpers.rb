module ContainersHelpers
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

  def container_start(id)
    HTTP.post HOST+"/containers/#{id}/start"
  end

  def container_stop(id)
    HTTP.post HOST+"/containers/#{id}/stop"
  end

  def container_restart(id)
    HTTP.post HOST+"/containers/#{id}/restart?t=1"
  end

  def container_delete(id)
    HTTP.delete HOST+"/containers/#{id}"
  end
end
