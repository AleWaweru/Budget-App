class PagesController < ApplicationController
  def splash
    @category = Category.new # or find an existing category based on your app's logic
  end
end
