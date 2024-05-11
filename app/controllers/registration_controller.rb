class RegistrationController < ApplicationController
    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params) # Instead of params[:user], we create a 'helper method' for secuity purposes.
        if @user.save # If DB accepts new User object then notify the user
            session[:user_id] = @user.id
            flash[:notice] = "Account successfully created!"
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
        rescue ActiveRecord::RecordNotUnique => e
            # Handle duplicate record error
            flash.now[:alert] = "Username already exists. Please choose a different one."
            render :new, status: :unprocessable_entity
    end

    def user_params
        # params.require(:user) is similar to params[:user] except it ensures no empty object is submitted
        # .permit() allows only the attributes specified instead everything
        params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :created_at, :updated_at)
    end
end