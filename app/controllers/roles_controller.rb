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
    if request.post?
      params[:role].each do |role|
        rle = Role.find(role[0])
        rle.update_attribute(:enable_role, role[1]["role_name"])
      end
      redirect_to roles_path
    end
  end
  
  private
  def role_params
    params.require(:role).permit(:role_name)
  end
end
