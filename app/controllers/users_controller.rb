class UsersController < ApplicationController
  before_action :load_roles, only: [:new, :create, :index, :search]
  
  def index
    @users = User.paginate(:page => params[:page], :per_page => 10)
  end
  
  def new    
    @user = User.new
  end
  
  def create    
    @user = User.new(user_params)
    if @user.save
      if params[:images]
        params[:images].each { |image|
          @user.images.create(avatar: image)
        }
      end
      flash[:success] = "User created successfully!"
      redirect_to users_path
    else
      flash[:error] = "User creation failed!"
      render :new
    end
  end
  
  def search
    @users = User.where("roles IN (#{params[:role_name]})").paginate(:page => params[:page], :per_page => 10)
    render :index
  end
  
  def load_roles
    @roles = Role.where(enable_role: true)
  end
  
  private
  def user_params
    params.require(:user).permit!
  end
end
