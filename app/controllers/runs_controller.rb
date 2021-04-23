class RunsController < ApplicationController
  # The user must sign in before any of the actions.
  before_action :authenticate_user!

  # The new action which gets the page that allows the user to create a new run.
  # GET /users/runs/new
  def new
    @run = current_user.runs.new
  end

  # The create action which creates a run.
  # POST /users/runs or /users/runs.json
  def create
    @run = current_user.runs.new(run_params)

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
    # Only allow a list of trusted parameters through.
    # Creates the strong parameters for runs.
    def run_params
      params.require(:run).permit(:user_id, :starting_point, :destination, :date)
    end
end
