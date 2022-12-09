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
    @pledge = Pledge.find_by(project_id: @project.id)
    # where = all !!!
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to @project, notice: "Your project was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    project = Project.find(params[:id])
    project.update(project_params)
    redirect_to project_path(project)
  end


  def destroy
    project = Project.find(params[:id])
    project.destroy
  end

  private

  def project_params
    params.require(:project).permit(:name, :location, :Paragraph_title, :Description, :photo)
  end
end
