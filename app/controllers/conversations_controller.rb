class ConversationsController < ApplicationController
  before_filter :get_mailbox
  before_filter :get_box
  before_filter :check_current_subject_in_conversation, :only => [:show, :update, :destroy]
  def index
    @conversations = @mailbox.inbox.page(params[:page])
    #render @conversations
  end

  def show
    @receipts = @mailbox.receipts_for(@conversation).not_trash
  end

  private
  
  def get_mailbox
    @mailbox = current_user.mailbox
  end

  def check_current_subject_in_conversation
    @conversation = Conversation.find_by_id(params[:id])
    
    if @conversation.nil? or !@conversation.is_participant?(current_user)
      redirect_to conversations_path(:box => @box)
      return
    end
  end

  def get_box
    if params[:box].blank? or !["inbox","sentbox","trash"].include?params[:box]
      params[:box] = 'inbox'
    end
    @box = params[:box]
  end


end
