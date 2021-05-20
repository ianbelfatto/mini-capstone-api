class ProductsController < ApplicationController
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

    if current_user
      render json: {user: current_user, all_products: products}
    end
    # render json: products
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
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
    product.image_url = params[:image_url] || product.image_url
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
