require "http"

system "clear"

puts "Here are all of the products available on the webpage!"
puts ""

response = HTTP.get("http://localhost:3000/all_products")
puts response.parse