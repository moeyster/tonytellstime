class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end
  
  def create
    # render plain: params[:user].inspect
    @user = User.new(user_params)
    
    if @user.save
      redirect_to @user
    else
      # flash[:alert] = "user not created, please try again"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :role, :password, :password_confirmation)
    end
end
