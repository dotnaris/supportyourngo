class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @pledges = Pledge.all
  end

  # def user_params
  #   params.require(:user).permit(:name, :location )
  # end
end
