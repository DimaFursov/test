class ProjectsController < ApplicationController
  before_action :correct_user,   only: :destroy
  def index
    @projects = Project.all

  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "project created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  def destroy
    @project.destroy
    flash[:success] = "Project deleted"
    redirect_to request.referrer || root_url
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:project_name) #:picture
    end
    def correct_user
      @project = current_user.projects.find_by(id: params[:id])
      redirect_to root_url if @project.nil?
    end        
end
