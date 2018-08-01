class Application

  @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match=="/items/"
      item.name = req.path.split("/items/").last_response
      if item = @@items.find{|i| i.name == item.name}
        resp.write "#{Item.price}"
      else
        resp.status = 400
        resp.write = "Item not found"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
