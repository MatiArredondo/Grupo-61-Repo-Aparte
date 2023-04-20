class MessagesController < ApplicationController
  def create
    @chat = Chat.find(message_params[:id_chat])
    @message = @chat.message.create(message(message_params))
    if @message.save
      redirect_to chat_path(@message.id_chat)
    else
      render @chat.errors, status: :unprocessable_entity
    end
  end

  def message_params
    params.require(:message).permit(:content, :id_chat)
  end
end
