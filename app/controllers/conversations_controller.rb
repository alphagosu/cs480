class ConversationsController < ApplicationController
  before_filter :get_mailbox

  def index
    @conversations = @mailbox.inbox.page(params[:page])
    #render @conversations
  end


  private
  
  def get_mailbox
    @mailbox = current_user.mailbox
  end


end
