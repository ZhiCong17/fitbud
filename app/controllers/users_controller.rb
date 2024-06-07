class UsersController < ApplicationController
  def profile
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    # user = User.new(user_params)
    if @user.save
      redirect_to users_path, alert: "Profile updated"
    else
      render :profile, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:age, :gender, :fitness_goal, :height, :weight)
  end
end
