class WelcomeController < ApplicationController

  def home
    @categories = Category.all
    flash[:notice] = nil
    @projects = Project.search(params[:q])
    if @projects == []
      flash[:notice] = "Oops, We couldn't find any results"
    end
  end

  def category
    @categories = Category.all
    @category = Category.find(params[:id])
  end

end
