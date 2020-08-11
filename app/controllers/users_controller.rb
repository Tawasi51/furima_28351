class UsersController < ApplicationController
  def index
  end

  # def  new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(donation_params)   #「UserDonation」に編集
  #   binding.pry
  #   if @user.valid?
  #     @user.save  # バリデーションをクリアした時
  #     return redirect_to root_path
  #   else
  #     render "new"    # バリデーションに弾かれた時
  #   end
  # end

  #  private
  #  def user_params
  #   params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation, :family_name, :given_name, :kana_family_name,:kana_given_name,:birth_day)
  #  end
end
