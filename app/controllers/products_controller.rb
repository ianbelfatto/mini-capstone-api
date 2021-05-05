class ProductsController < ApplicationController
  def keyboard
    render json: {message: "sanity check"}
  end
end
