class UsersController < ApplicationController
  
  def index
    @users = User.all
    render 'list'
  end
  
  def upload
    uploaded_io = params[:users][:avatar_id]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to users_profile_path(@user)
    end
  end
  
  def profile
    @user = User.find_by_id(params[:id])
    if @user.nil?
      render_404
    end
      #render :text => 'Not Found', :status => 404
  end
  
  def update
    #logger.debug { params.inspect }
    #render :nothing => true
    @user = User.find(params[:id])
    if @user.update(user_params)
        @json = 'HELLO';
    else
       @json = '123'
    end
    respond_to do |format|
        #format.html { redirect_to :back, notice: 'You don\'t  like this picture anymore.' }
        #format.json { render json: @json }
        format.js {render :js => "window.location.href='"+users_profile_path+"'"}
    end
  end
  
  def sign_in
    
  end
  
  def sign_up
    
  end
  
  def user_params
    params.require(:user).permit!
  end
  
  def render_404
  respond_to do |format|
    format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
    format.xml  { head :not_found }
    format.any  { head :not_found }
  end
end
end
