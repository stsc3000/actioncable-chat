class PagesController < ApplicationController
  before_action :require_current_user

  def root
    redirect_to messages_path
  end
end
