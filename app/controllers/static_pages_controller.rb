class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @collaboration = current_user.collaborations.build
      @items = current_user.feed.paginate(page: params[:page])
    end
  end
end
