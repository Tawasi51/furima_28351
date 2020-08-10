class UsersController < ApplicationController
    
  def index
  end
  
  def  new
    @user = User.new   
  end
  
  def create
    @user = User.new(donation_params)   #「UserDonation」に編集
    @user.save
  end
 
  
   private
   def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)
   end
end
