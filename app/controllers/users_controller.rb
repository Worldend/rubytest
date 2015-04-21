class UsersController < ApplicationController
  
  def new
    
  end
  
  def profile
    @user = User.find_by_id(params[:id])
    if @user.nil?
      render_404
    end
      #render :text => 'Not Found', :status => 404
  end
  
  def list
    @users = User.all
  end
  
  def render_404
  respond_to do |format|
    format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
    format.xml  { head :not_found }
    format.any  { head :not_found }
  end
end
end
