class ProjectsController < ApplicationController
  before_action :require_logged_in, except: [:show]
  before_action :find_project, only: [:show, :support, :edit, :update]


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
  end

  def support
    @project.funds_acquired += params[:project][:funds_acquired].to_i
    @project.update(funds_acquired: @project.funds_acquired)
    @project.backers << current_user
    redirect_to project_path(@project)
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :funds_needed, :funds_acquired, :number_of_supporters, :image_url, :creator_id, :category_id)
  end

end
