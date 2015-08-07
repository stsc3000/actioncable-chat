class MessagesController < ApplicationController
  before_action :require_current_user

  def index
    @current_messages = Message.current.includes(:user).reverse
  end

  def create
    message = current_user.messages.create(message_params)
    ActionCable.server.broadcast 'messages', { message: message,
                                               user: current_user }
    head :ok
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
