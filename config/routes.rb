Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

get "/keyboard", controller: "products", action: "keyboard"
get "/mouse", controller: "products", action: "mouse"
get "/mousepad", controller: "products", action: "mousepad"
get "/all_products", controller: "products", action: "all_products"

end
