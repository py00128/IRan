class RunsController < ApplicationController
  # The set_user method is called before specific actions.
  before_action :set_user, only: %i[ new create ]

  # The new action which gets the page that allows the user to create a new run.
  # GET /users/runs/new
  def new
    @run = Run.new
    if Run.last
      @run_id = Run.last.id + 1
    else
      @run_id = 1
    end
  end

  # The create action which creates a run.
  # POST /users/runs or /users/runs.json
  def create
    @run = Run.new(run_params)
    if Run.last
      @run_id = Run.last.id + 1
    else
      @run_id = 1
    end

    respond_to do |format|
      if @run.save
        format.html { redirect_to root_path, notice: t('.notice') }
        format.json { render :show, status: :created, location: root_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Sets the current run.
    def set_run
      @run = Run.find(params[:id])
    end

    # Finds the user using the params
    def set_user
      @user = User.find_by(id: params[:user_id]) || User.find(run_params[:userID])
    end

    # Only allow a list of trusted parameters through.
    # Creates the strong parameters for runs.
    def run_params
      params.require(:run).permit(:userID)
    end
end
