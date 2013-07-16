class StaticPagesController < ApplicationController

  def home
    if signed_in?
      # @micropost  = current_user.microposts.build
      # @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end
  
  def help
  end

  def about
  end

  def contact
  end
end
