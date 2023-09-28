class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :splash
  def splash
    @user = User.new
  end
end
