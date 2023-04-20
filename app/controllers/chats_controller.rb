class ChatsController < ApplicationController
  def index
    @chat = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to chat_path(@chat.id)
    else
      render @chat.errors, status: :unprocessable_entity
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
