class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @project = Project.all
  end
end
