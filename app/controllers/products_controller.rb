class ProductsController < ApplicationController
  def keyboard
    keyboard = Product.find_by(name: "Keyboard")
    render json: keyboard
  end
  def mouse
    mouse = Product.find_by(name: "Mouse")
    render json: mouse
  end
  def mousepad
    mousepad = Product.find_by(name: "Mousepad")
    render json: mousepad
  end

  def all_products
    all_products = Product.all
    render json: all_products
  end
end
