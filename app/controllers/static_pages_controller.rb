class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @collaboration = current_user.collaborations.build
      @users = current_user.feed(current_user).paginate(page: params[:page])
    end
  end
end
