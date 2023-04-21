class ProductsController < ApplicationController
  def index
    if user_signed_in?
      @products = Product.all
    else
      render json: "No has iniciado sesion"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: {message: "Producto was successfully created."}
    else
      render @product.errors, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_url(@product), notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.delete
    redirect_to products_url, notice: "Product was successfully destroyed."
  end

  def product_params
    params.require(:product).permit(:name, :price, :image)
  end
end
