class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      sign_out(current_user)
      redirect_to new_user_session_path, notice: 'You have signed out.'
    else
      @user = current_user
    end
  end
end

