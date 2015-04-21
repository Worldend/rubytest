class RegistrationController < ApplicationController
  def index 
    #@user = User.where(login: params(:login))
    #if @user.nil?
     # @new_user = User.new(sign_params)
     # if @new_user.save
     #   redirect_to @new_user
     # else
      #  render 'index'
     # end
    #end
    @user = User.new
  end
  
  def sign_params
    params.require(:user).permit!
  end
end
