class OrdersController < ApplicationController
  before_action :authenticate_user
  def create
    carted_products = CartedProduct.where("status LIKE ?", "carted")
    if carted_products
      order = Order.new(
        user_id: current_user.id,
      )
      
      # SUBTOTAL CALCULATION ------------------------------------
      # new order subtotal looks at all items with status "carted", loop would iterate through each item with status "carted" and grab product id and product price - multiply together for subtotal
      order.subtotal = carted_product.product_id.price * carted_product.quantity

      order.subtotal = order.quantity * order.product.price
      order.tax = order.subtotal * 0.09
      order.total = order.tax + order.subtotal

      # SUBTOTAL CALCULATION ------------------------------------

      if order.save
        render json: order
      else
        render json: {errors: order.errors.full_messages}, status: 422
      end
  end

  def show
    if current_user
      order = current_user.orders.find_by(id: params[:id])
      if order
        render json: order
      else
        render json: {message: "Order doesn't exist!"}
      end
    else render json: [], status: :unauthorized
    end
  end

  def index
    if current_user
      orders = current_user.orders
      render json: orders
    else render json: [], status: :unauthorized
    end
  end
end
