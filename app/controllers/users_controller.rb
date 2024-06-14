class UsersController < ApplicationController
  def profile
  end

  def update
    # raise
    @user = User.find(params[:id])
    @user.update(user_params)
    # raise
    # user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "Profile updated"
    else
      render :profile, status: :unprocessable_entity
    end
  end

  def notify
    flash[:notice] = "No Workout Plan Found"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:age, :gender, :fitness_goal, :height, :weight)
  end
end
