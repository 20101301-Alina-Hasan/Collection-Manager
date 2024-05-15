class LoginController < ApplicationController
    def new
        render "login/new"
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.present? && @user.authenticate(params[:password]) # authenticate works with has_secure_password in your User model to match hash values
            if @user.status
                session[:user_id] = @user.id 
                @user.touch # Update updated_at timestamp
                flash[:notice] = "Welcome back, #{@user.name}"
                redirect_to root_path
              else
                flash[:alert] = "Your account has been blocked. Please contact administrator."
                redirect_to login_path
              end
        else
            flash[:alert] = "The Email or password you have provided is incorrect. Please try again."
            render "login/new", status: :unprocessable_entity
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "You have been logged out."
        redirect_to root_path
    end
end