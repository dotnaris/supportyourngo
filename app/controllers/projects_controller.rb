class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:query].present?
      sql_query = "name @@ :query OR location @@ :query"
      @projects = Project.where(sql_query,
        query: "%#{params[:query]}%")
    else
      @projects = Project.all
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :photo)
  end
end
