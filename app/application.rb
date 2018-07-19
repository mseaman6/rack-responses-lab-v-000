class Application

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

    @@items.each do |item|
      resp.write "#{item}\n"
    end
 

    resp.finish
  end

end
