class OrdersController < ApplicationController
    def order_params
        params.require(:order).permit(:id_product, :id_user, :description, :status, :order_date)
    end


    def index
        @orders_user = Order.where("id_user = ?", params[:id_user])
        render json: @orders_user
    end


    def  create
        @user = User.find(params[:id_user])
        @product = Product.find(params[:id_product])

        @order = @user.order.build(order_params.merge(product_id: @product.id))

        if @order.save
            render json: {message: "La orden a sido recibida"}
        else
            render json: @order.errors, status: :unprocessable_entity
        end
    end

"""
update prox sprint
"""
    def update
        @user = User.find(params[:id_user])
        @order = @user.order.find(params[:id])

        if @order.update(order_params)
            render json: {message: "El estado de la orden se actualizo"}
        else
            render json: @order.errors, status: :unprocessable_entity
        end
    end


    def destroy
        @user = User.find(params[:id_user])
        @order = @user.order.find(params[:id])

        if @order.destroy
            render json: {message: "La orden se eliminó correctamente."}
        else
            render json: @order.errors, status: :unprocessable_entity
        end
    end

end


end
