class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create # Needed for developer strategy

  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    cookies.signed[:user_id] = user.id
    redirect_to messages_path
  end

  def destroy
    cookies.signed[:user_id] = nil
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
