class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    product_id = params[:id]
    product = Product.find_by(id: product_id) # ID SHOULD BE DYNAMIC
    render json: product.as_json
  end
end
