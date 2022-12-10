class ContributionsController < ApplicationController

  def index
    @contributions = Contribution.all
  end

  def show
    @contribution = Contribution.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @contribution = Contribution.new
  end

  def create
    @contribution = Contribution.new(contribution_params)
    if @contribution.save
      redirect_to project_contribution_path, notice: "You have successfully contributed to this project!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def contribution_params
    params.require(:contribution).permit(:amount)
  end

end
