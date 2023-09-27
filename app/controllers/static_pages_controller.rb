class StaticPagesController < ApplicationController
  def splash
    @user = User.new
  end
end
