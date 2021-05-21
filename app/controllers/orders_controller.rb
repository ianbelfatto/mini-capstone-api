class OrdersController < ApplicationController
  def create
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      # subtotal: params[:subtotal],
      # tax: params[:tax],
      # total: params[:total]
    )
    # SUBTOTAL CALCULATION ------------------------------------
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
