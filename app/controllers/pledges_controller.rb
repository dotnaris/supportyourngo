class PledgesController < ApplicationController

  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.user = current_user
    if @pledge.save
      redirect_to @pledge, notice: "Your pledge was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    pledge = Pledge.find(params[:id])
    pledge.update(pledge_params)
    redirect_to pledge_path(pledge)
  end

  def destroy
    pledge = Pledge.find(params[:id])
    pledge.destroy
  end

  private

  def user_params
    params.require(:pledge).permit(:title, :reward, :description, :price)
  end
end
