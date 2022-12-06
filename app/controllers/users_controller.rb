class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @pledges = Pledge.all
  end
end
