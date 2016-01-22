class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user
  	else 
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
    if !params[:task_status].nil?
      @to_do_lists = @user.to_do_list.where("status = ?", params[:task_status]).paginate(page: params[:page])
    else 
      @to_do_lists = @user.to_do_list.paginate(page: params[:page])
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
