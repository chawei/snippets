require 'net/http'

Net::HTTP.start("i.eimg.com.tw") { |http|
  resp = http.get("/d/artist/98/47198.300.jpg")
  File.open("fun.jpg", "wb") { |file|
    file.write(resp.body)
   }
}
puts "Yay!!"