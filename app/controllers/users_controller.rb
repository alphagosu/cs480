class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:index, :destroy]
  # as of now, only the admin can see the user list

  def subregion_options
    render partial: 'subregion_select'
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by_id(params[:id])
    if @user.nil?
      redirect_to root_path
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def settings
    @user = User.find(params[:id])
  end

  def notifications
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      # user saved successfully
      sign_in @user
      flash[:success] = "Welcome to the Research Collaboration Tool!"
      redirect_to @user
    else
      render 'new'
    end
    
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      elsif URI(request.referer).path == edit_user_path
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      elsif URI(request.referer).path == settings_user_path
        format.html { render action: 'settings' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      else
        format.html { render action: 'notifications' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :country, :state, :county, :password, :password_confirmation, :is_researcher, :is_teacher, :is_student, :is_comm_member, :main_interests, :s_animal, :s_children, :s_adults, :s_environment, :s_cells, :study_location, :experience, :travel_distance, :i_obesity, :i_diabetes, :i_heart, :i_injury, :i_violence_prevention, :i_falls, :avatar, :notify_new_message, :notify_new_collab, :notify_collab_percent, :desc)
    end


    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
