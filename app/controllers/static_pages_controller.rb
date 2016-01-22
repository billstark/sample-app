class StaticPagesController < ApplicationController
  def home
    @tag = params[:tag_id]
  	@newtask = current_user.to_do_list.build if logged_in?
  	@feed_items = current_user.feed(@tag).paginate(page: params[:page]) if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
  
end
