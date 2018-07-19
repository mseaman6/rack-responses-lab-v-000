class Application

  @@items = ["Apples","Carrots","Pears"]

  def call(env)
    resp = Rack::Response.new

    #current_time = Time.now
    #resp.write "#{current_time}\n"
    #resp.write "#{current_time.hour}\n"

    #if current_time.hour >= 12
    #  resp.write "Good Afternoon!"
    #else
    #  resp.write "Good Morning!"
    #end

    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
 
      search_term = req.params["q"]
 
      if @@items.include?(search_term)
        resp.write "#{search_term} is one of our items"
      else
        resp.write "Couldn't find #{search_term}"
      end
    else
      resp.write "Path Not Found"
    end


    resp.finish
  end

end
