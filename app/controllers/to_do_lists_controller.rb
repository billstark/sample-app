class ToDoListsController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :destroy, :update]
  before_action :correct_user,   only: [:destroy, :update]

  def create
  	@newtask = current_user.to_do_list.build(to_do_list_params)
    @newtask.status = 1;
  	if @newtask.save
  	  flash[:success] = "New task added"
  	  redirect_to root_url
  	else 
      @feed_items = current_user.to_do_list.where("status = ?", 1).paginate(page: params[:page])
  	  render 'static_pages/home'
  	end
  end

  def destroy
    @todolist.update_attributes!(:status => 0)
    flash[:success] = "Task completed!"
    redirect_to request.referrer || root_url
  end

  def update
    @todolist.update_attributes!(:status => 1)
    flash[:success] = "Task recovered!"
    redirect_to request.referrer || root_url
  end
	
  private

  	# In this function, data will be got from the form
    def to_do_list_params
      params.require(:to_do_list).permit(:description, :tag_id)
    end

    def correct_user
      @todolist = current_user.to_do_list.find_by(id: params[:id])
      redirect_to root_url if @todolist.nil?
    end
end
