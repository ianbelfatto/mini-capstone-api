class CartedProductsController < ApplicationController
  before_action :authenticate_user
  def index
    carted_products = CartedProduct.where("status LIKE ?", "carted")
    render json: carted_products
  end

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil
    )
    if carted_product.save
      render json: carted_product
    else
      render json: {errors: product.errors.full_messages}, status: 422
    end
  end
end
