require "http"
# require "tty"

system "clear"

puts "Here are all of the products available on the webpage!"
puts ""

mouse = HTTP.get("http://localhost:3000/mouse")
puts "Razer Atheris"
puts mouse.parse
puts ""
keyboard = HTTP.get("http://localhost:3000/keyboard")
puts "Razer Blackwidow Lite TKL"
puts keyboard.parse
puts ""
mousepad = HTTP.get("http://localhost:3000/mousepad")
puts "Razer Goliathus Stealth"
puts mousepad.parse