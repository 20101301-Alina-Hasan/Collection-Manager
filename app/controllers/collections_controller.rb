class CollectionsController < ApplicationController
  before_action :require_login
  before_action :set_collection, only: %i[show edit update]

  def index
    @collections = Current.user.collections
  end

  def show
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Current.user.collections.new(collection_params)
    if @collection.name.present?
      if @collection.save
        flash[:notice] = 'Collection successfully added.'
        redirect_to collections_path
      else
        flash[:alert] = 'Collection could not be added. Please try again.'
        render :new, status: :unprocessable_entity
      end
    else
      flash[:alert] = 'Title cannot be empty. Please name your collection.'
      redirect_to new_collection_path
    end
  end
  
  def edit
  end
  
  def update
    if @collection.update(collection_params)
      flash[:notice] = 'Collection was successfully updated.'
      redirect_to collections_path
    else
      flash[:alert] = 'Collection could not be updated. Please try again.'
      render :edit, status: :unprocessable_entity
    end
  end

  def bulk_destroy
    @selected_collections = Current.user.collections.where(id: params.fetch(:collection_ids, []).compact)
    deleted_collections_count = @selected_collections.count
    @selected_collections.destroy_all
    flash[:alert] = "#{deleted_collections_count} collection#{'s' unless deleted_collections_count == 1} were deleted successfully."
    redirect_to collections_path
  end

  private

  def require_login
    unless session[:user_id]
    flash[:alert] = "You must be logged in to access this page."
    redirect_to login_path
    end
  end

  def set_collection
    @collection = Current.user.collections.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:name, :description, :image_url,
      custom_details_attributes: [:int1_flag, :int1_name, :int2_flag, :int2_name, :int3_flag, :int3_name,
                                  :string1_flag, :string1_name, :string2_flag, :string2_name, :string3_flag, :string3_name,
                                  :txt1_flag, :txt1_name, :txt2_flag, :txt2_name, :txt3_flag, :txt3_name,
                                  :bool1_flag, :bool1_name, :bool2_flag, :bool2_name, :bool3_flag, :bool3_name,
                                  :date1_flag, :date1_name, :date2_flag, :date2_name, :date3_flag, :date3_name])
  end
end
