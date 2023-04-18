class ChatsController < ApplicationController
  def index
    @chat = Chat.find([params[:id_chat]])
    render json: @chat
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      render json: {message: "El chat se creo correctamente."}
    else
      render @chat.errors, status: :unprocessable_entity
    end
  end

  def update
    @chat = Chat.find(params[:id_chat])
    if @chat.update(chat_params)
      render json: @chat
    else
      render json:@chat.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @chat = Chat.find(params[:id_chat])
    if @chat.destroy
      render json: {message: "El chat se eliminó correctamente."}
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  def chat_params
    params.require(:chat).permit(:id_user)
  end
end
