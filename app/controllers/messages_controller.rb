class MessagesController < ApplicationController
  before_filter :get_user
  before_filter :get_box

  def index
    redirect_to conversation_path(:box => @box)
  end

  def create 
    if params[:message][:recipients].present?
      @recipients = User.find_by_id(params[:message][:recipients])
    else
      []
    end
    puts @user.name
    puts @recipients.name
    @receipt = @user.send_message(@recipients, params[:message][:body], params[:message][:subject], "New Message", "New Message")
    if (@receipt.errors.blank?)
      @conversation = @receipt.conversation
      #flash[:success]= "Message sent"
      redirect_to conversations_path
    else
      render :action => :new
    end    
  end

  def new
    if params[:reciever].present?
      @recipient = User.find_by_id(params[:reciever])
      puts @recipient
      return if @recipient.nil?
      @recipient = nil if current_user = @recipient
    end
  end

  private

  def get_user
    @user = current_user
  end

  def get_box
    if params[:box].blank? or !["inbox","sentbox","trash"].include?params[:box]
      @box = "inbox"
      return
    end
    @box = params[:box]
  end


end
