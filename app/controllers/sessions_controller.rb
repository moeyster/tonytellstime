class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.where(email: params[:session][:email]).first
        
        if @user
                if @user.authenticate(params[:session][:password])  
                    session[:user_id] = @user.id
                    redirect_to root_path, notice: 'Successfully signed in!'
                else
                    flash[:notice] = "Incorrect username or password"
                    render 'new'
                end
        else
            flash[:notice] = "User cannot be found"
            render 'new'
        end
    end
    
    def destroy
        if session[:user_id]
           session[:user_id] = nil
           redirect_to root_path, notice: "successfully signed out"
        end
    end
end
