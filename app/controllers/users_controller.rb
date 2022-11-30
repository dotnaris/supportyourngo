class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @projects = Project.find(params[:id])
  end
end
