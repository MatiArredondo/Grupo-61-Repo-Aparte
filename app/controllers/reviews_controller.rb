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
            render json: {message: "Review was successfully created."}
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end


    def update
        @user = User.find(params[:id_user])
        @review = @user.reviews.find(params[:id])

        if @review.update(review_params)
            render json: {message: "Review was successfully updated."}
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end


    def destroy
        @user = User.find(params[:id_user])
        @review = @user.reviews.find(params[:id])

        if @review.delete
            render json: {message: "Review was sucessfully deleted."}
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end

end
