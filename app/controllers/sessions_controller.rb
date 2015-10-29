class SessionsController < ApplicationController
  before_action :prevent_login_signup, only: [:login]

  def login
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(email: params[:email]).first
      if found_user and found_user.authenticate params[:password]
        login_user(found_user)
        redirect_to root_path
      else
        redirect_to root_path
      end
    else
      redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end