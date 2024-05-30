class UsersController < ApplicationController
  before_action :require_login
  before_action :require_admin, only: [:index]
  
    def index
      # @users = User.order(:id).paginate(page: params[:page], per_page: 10)  # Without ransack
      @search_items = User.ransack(params[:q])
      @users = @search_items.result(distinct: true).paginate(page: params[:page], per_page: 12)
    end

    def bulk_update
       action = params[:commit] 
       user_ids = params[:user_ids] || [] 
      case action
        when "Block"
          block(user_ids)
        when "Unblock"
          unblock(user_ids)
        when "Delete"
          destroy(user_ids)
        when "Add Admin"
          add_admin(user_ids)
        when "Remove Admin"
          remove_admin(user_ids)
        end
        redirect_to users_path 
     end
  
    private
  
    def block(user_ids)
      @selected_users = User.where(id: params.fetch(:user_ids, []).compact)
      @selected_users.update_all(status: false) 
      puts "Current User ID: #{session[:user_id]}"
      if user_ids.include?(session[:user_id].to_s)
        reset_session
      end
      unless @selected_users.count == 1
        flash[:alert] = "#{@selected_users.count} users blocked successfully."
      else
        flash[:alert] = "#{@selected_users.count} user blocked successfully."
      end
    end
    
    def unblock(user_ids)
      @selected_users = User.where(id: params.fetch(:user_ids, []).compact)
      @selected_users.update_all(status: true) 
      unless @selected_users.count == 1
        flash[:notice] = "#{@selected_users.count} users unblocked successfully."
      else
        flash[:notice] = "#{@selected_users.count} user unblocked successfully."
      end
    end
  
    def destroy(user_ids)
      @selected_users = User.where(id: params.fetch(:user_ids, []).compact)
      @selected_users = @selected_users.where.not(id: Current.user.id, username: 'admin')
      deleted_users_count = @selected_users.count
      @selected_users.destroy_all
      if Current.user.username == 'admin'
        flash[:alert] = "Chief Administrator cannot be removed."
        return
      elsif user_ids.include?(session[:user_id].to_s)
        reset_session
      end
      unless deleted_users_count == 1
        flash[:alert] = "#{deleted_users_count} users deleted successfully."
      else
        flash[:alert] = "#{deleted_users_count} user deleted successfully."
      end
    end
  
    def add_admin(user_ids)
      @selected_users = User.where(id: params.fetch(:user_ids, []).compact)
      @selected_users.update_all(admin: true)
      unless @selected_users.count == 1
        flash[:notice] = "#{@selected_users.count} users have been promoted to admin."
      else
        flash[:notice] = "#{@selected_users.count} user has been promoted to admin."
      end
    end

    def remove_admin(user_ids)
      @selected_users = User.where(id: params.fetch(:user_ids, []).compact)
      @selected_users = @selected_users.where.not(id: Current.user.id, username: 'admin')
      @selected_users.update_all(admin: false)
      if @selected_users.count == 1
        flash[:notice] = "#{@selected_users.count} user has been demoted from admin."
      elsif @selected_users.count == 0
        flash[:alert] = "No user has been demoted from admin. NOTICE: The Chief Administrator cannot be removed."
      else
        flash[:notice] = "#{@selected_users.count} users have been demoted from admin."
      end
    end

    def require_login
      unless session[:user_id]
      flash[:alert] = "You must be logged in to access this page."
      redirect_to login_path
      end
    end

    def require_admin
      unless Current.user.admin?
        flash[:alert] = "You do not have permission to access this page."
        redirect_to root_path
      end
    end
end
  