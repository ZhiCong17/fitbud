class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if user.save
      redirect_to users_path
    end
  end
end
