class UsersController < ApplicationController
  
def new
    @user = User.new
end

def show

    @user =User.find_by_id(params[:id])
end

def create
# byebug
    # if params[:user][:password] == params[:user][:password_confirmation]
        # @user = User.create(user_params)
        if @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
        else
            render :new
        end
    # else
    #     redirect_to '/users/new'
    # end
end


  private

  def user_params
    params.require(:user).permit(:name, :password, :nause, :happiness, :tickets, :height)
  end
end
