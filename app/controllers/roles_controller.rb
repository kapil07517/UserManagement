class RolesController < ApplicationController
  
  def index
    @roles = Role.paginate(:page => params[:page], :per_page => 10)
  end
  
  def new
    @role = Role.new
  end
  
  def create
    @role = Role.new(role_params)
    if @role.save
      flash[:success] = "Created role successfully!"
      redirect_to roles_path
    else
      flash[:error] = "Role creation failed!"
      render :new
    end
    
  end
  
  def hide_roles
    @roles = Role.all
  end
  
  private
  def role_params
    params.require(:role).permit(:role_name)
  end
end
