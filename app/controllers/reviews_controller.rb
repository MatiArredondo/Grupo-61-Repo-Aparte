class ReviewsController < ApplicationController
    def review_params
        params.require(:review).permit(:id_user, :id_product, :content, :grade)
    end


    def index
        @review_order = Review.where("id_product = ?", params[:id_product])
        render json: @review_order
    end


    def  create
        @user = User.find(params[:id_user])
        @product = Product.find(params[:id_product])

        @review = @user.reviews.build(review_params.merge(product_id: @product.id))

        if @review.save
            render json: {message: "La review se creo correctamente."}
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end


    def update
        @user = User.find(params[:id_user])
        @review = @user.reviews.find(params[:id])

        if @review.update(review_params)
            render json: {message: "La review se edito correctamente."}
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end


    def destroy
        @user = User.find(params[:id_user])
        @review = @user.reviews.find(params[:id])

        if @review.destroy
            render json: {message: "La review se eliminó correctamente."}
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end

end
