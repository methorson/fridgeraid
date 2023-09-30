class UsersController < ApplicationController
  def destroy
    if confirm_logout?
      @user = User.find(params[:id])
      @user.destroy
      redirect_to new_user_session_path, status: :see_other
    else
      redirect_to fridge_lists_path, alert:"Logout cancelled."
    end
  end

end
