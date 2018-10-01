class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.creator_id = current_user.id
    @project.save
    redirect_to project_path(@project)
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :funds_needed, :funds_acquired, :number_of_supporters, :image_url, :creator_id, :category_id)
  end

end
