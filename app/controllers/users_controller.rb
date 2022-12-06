class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @Pledges = Pledge.all
  end
end
