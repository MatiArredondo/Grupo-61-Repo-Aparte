class ProductsController < ApplicationController
  def index
    @product = Product.find([params[:id_product]])
    render json: @product
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: {message: "El producto se creo correctamente."}
    else
      render @product.errors, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id_product])
    if @product.update(product_params)
      render json: {message: "El producto se actualizo correctamente."}
    else
      render json:@product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id_product])
    if @product.destroy
      render json: {message: "El producto se eliminó correctamente."}
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
