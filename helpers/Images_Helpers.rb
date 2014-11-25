module ImagesHelpers
  def images_list
    conn = HTTP.get HOST + '/images/json'
    resp = conn.body.readpartial
    JSON.parse(resp)
  end

  def image_show(name)
    conn = HTTP.get HOST + "/images/#{name}/json"
    resp = conn.body.readpartial
    JSON.parse(resp)
  end

  def image_history(name)
    conn = HTTP.get HOST + "/images/#{name}/history"
    resp = conn.body.readpartial
    JSON.parse(resp)
  end

  def image_delete(name)
    HTTP.delete HOST + "/images/#{name}"
  end
end
