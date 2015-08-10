class MessagesController < ApplicationController
  before_action :require_current_user

  def index
    @current_messages = Message.current.includes(:user).reverse
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
