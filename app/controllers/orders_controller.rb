class OrdersController < ApplicationController
    include Devise::Controllers::Helpers
    def order_params
        params.require(:order).permit(:id_product, :description, :status, :order_date)
    end


    def index
        @orders_user = current_user.order.all
    end

    def show
        @orders_user = current_user.order
    end


    def  create
        @order = current_user.order.create(order_param)

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

