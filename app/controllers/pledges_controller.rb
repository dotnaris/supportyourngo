class PledgesController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @project = Project.find(params[:project_id])
    @pledge.project = @project
    # raise
    if @pledge.save
      redirect_to project_path(@project), notice: "Your pledge was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    pledge = Pledge.find(params[:id])
    pledge.update(pledge_params)
    redirect_to project_path(pledge.project)
  end

  def destroy
    pledge = Pledge.find(params[:id])
    pledge.destroy
  end

  private

  def pledge_params
    params.require(:pledge).permit(:title, :reward, :description, :price)
  end
end
