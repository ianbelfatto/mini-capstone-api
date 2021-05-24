class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  def index
    products = Product.all
  # SQL CONDITIONS
    if params[:search]
      products = products.where("name iLIKE ?", "%#{params[:search]}%")
    end

    if params[:sort] == "price"
      products = products.order(:price)
    end

    if params[:sort] == "price" && params[:sort_order] == "desc"
      products = products.order(price: :desc)
    end

    if params[:sort] ==
      products = products.order(:id)
    end

    if params[:discount] == "true"
      products = products.where("price < 100")
    end
    render json: products
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      inventory: params[:inventory]
    )
    if product.save
      # HAPPY PATH
      render json: product
    else
      # SAD PATH
      render json: {errors: product.errors.full_messages}, status: 422
    end
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.description = params[:description] || product.description
    product.inventory = params[:inventory] || product.inventory
    if product.save
      # HAPPY PATH
      render json: product
    else
      # SAD PATH
      render json: {errors: product.errors.full_messages}, status: 422
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: {message: "Product deleted!"}
  end
end
