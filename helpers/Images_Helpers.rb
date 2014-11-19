module ImagesHelpers
  def image_inspect(name)
    conn = HTTP.get HOST+"/images/#{name}/json"
    resp = conn.body.readpartial
    JSON.parse(resp)
  end
end
