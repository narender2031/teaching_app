class UsersController < ApplicationController
  

  def show
 		@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	# if @user.save
  	# 	auto_login(@user)
  	# 	redirect_back_or_to(campaigns_url, notice: "Signed up!")
  	# else
  	# 	render "new"
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		redirect_to 
  end

  private
  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :city_time_zone, :remember )
  end
end
