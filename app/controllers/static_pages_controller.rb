class StaticPagesController < ApplicationController
  def home
    (1..10000).each do |x|
      Rails.cache.fetch "key-#{x}" do
        rand(1..1000)
      end
    end
    
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
