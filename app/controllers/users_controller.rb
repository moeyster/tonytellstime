class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    # render plain: params[:user].inspect
    @user = User.new(user_params)
    
    if @user.save
      UserMailer.welcome_email(@user).deliver #to send email
      redirect_to @user, notice: 'Successfully created a user'
    else
      flash[:alert] = "User not created, please try again"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to @user, notice: 'Successfully updated user!'
    else
      flash[:notice] = "Couldn't update user!"
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.delete
      redirect_to @user, notice: 'Deleted user'
    else
      redirect_to request.referrer, notice: 'Could not destroy user'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :role, :password, :password_confirmation)
    end
end
