class WelcomeController < ApplicationController

  def home
    flash[:notice] = nil
    @projects = Project.search(params[:q])
    if @projects == []
      flash[:notice] = "Oops, We couldn't find any results"
    end
  end

end
