class CollaborationsController < ApplicationController
  before_action :set_collaboration, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user
  # GET /collaborations
  # GET /collaborations.json
  def index
    @collaborations = Collaboration.all
  end

  # GET /collaborations/1
  # GET /collaborations/1.json
  def show
  end

  # GET /collaborations/new
  def new
    @collaboration = Collaboration.new
  end

  # GET /collaborations/1/edit
  def edit
  end

  # POST /collaborations
  # POST /collaborations.json
  def create

    @collaboration = current_user.collaborations.build(collaboration_params)
    if @collaboration.save
      flash[:success] = "Collaboration successfully created!"
      redirect_to @collaboration
    else
      render 'new'
    end

  end

  # PATCH/PUT /collaborations/1
  # PATCH/PUT /collaborations/1.json
  def update
    respond_to do |format|
      if @collaboration.update(collaboration_params)
        format.html { redirect_to @collaboration, notice: 'Collaboration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @collaboration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collaborations/1
  # DELETE /collaborations/1.json
  def destroy
    @collaboration.destroy
    respond_to do |format|
      format.html { redirect_to collaborations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collaboration
      @collaboration = Collaboration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collaboration_params
      params.require(:collaboration).permit(:name, :desc, :country, :state, :county,
                                            :stage, :n_funding, :n_study_patterns, 
                                            :n_space, :n_areas_of_expertise, 
                                            :n_previous_work, :n_expertise, :picture)
    end
end
