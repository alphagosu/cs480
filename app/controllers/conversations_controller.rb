class ConversationsController < ApplicationController
  before_filter :get_mailbox
  before_filter :get_box
  before_filter :get_user
  before_filter :check_current_subject_in_conversation, :only => [:show, :update, :destroy]
  def index
    @conversations = @mailbox.inbox.page(params[:page])
    #render @conversations
  end

  def show
    @receipts = @mailbox.receipts_for(@conversation).not_trash
  end

  def update
    if params[:untrash].present?
      @conversation.untrash(@user)
    end

    if params[:reply_all].present?
      last_receipt = @mailbox.receipts_for(@conversation).last
      @receipt = @user.reply_to_all(last_receipt, params[:body])
    end

    if @box.eql? 'trash'
      @receipts = @mailbox.receipts_for(@conversation).trash
    else
      @receipts = @mailbox.receipts_for(@conversation).not_trash
    end

    redirect_to action: :show
    @receipts.mark_as_read
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

  def get_user
    @user = current_user
  end

  def get_box
    if params[:box].blank? or !["inbox","sentbox","trash"].include?params[:box]
      params[:box] = 'inbox'
    end
    @box = params[:box]
  end


end
