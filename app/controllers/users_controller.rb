class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_bookmarks = @user.bookmarks
    @user_likes = @user.likes
    @topics = Topic.all
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to root_path
    else
      flash[:error] = "Sorry, there was an error updating your information. Please try again"
      redirect_to edit_user_registration_path
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :avatar)
  end

end
