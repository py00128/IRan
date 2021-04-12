class RunsController < ApplicationController
  # The set_run method is called before specific actions.
  before_action :set_run, only: %i[ show edit update destroy ]
  # The set_user method is called before specific actions.
  before_action :set_user, only: %i[ new edit create update ]

  # The index action which gets the page which shows the user all of their runs.
  # GET /users/runs or /users/runs.json
  def index
    @runs = Run.all
  end

  # The show action which gets the page which shows the current run to the user.
  # GET /users/runs/1 or /users/runs/1.json
  def show
  end

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

  # The edit action which gets the page that allows the user to update a run.
  # GET /users/runs/1/edit
  def edit
    @run_id = @run.id
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
        format.html { redirect_to @run, notice: t('.notice') }
        format.json { render :show, status: :created, location: @run }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # The update action which updates a run.
  # PATCH/PUT /users/runs/1 or /users/runs/1.json
  def update
    @run_id = @run.id

    respond_to do |format|
      if @run.update(run_params)
        format.html { redirect_to @run, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @run }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # The destroy action which removes a run.
  # DELETE /users/runs/1 or /users/runs/1.json
  def destroy
    @run.destroy
    respond_to do |format|
      format.html { redirect_to user_runs_url, notice: t('.notice') }
      format.json { head :no_content }
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
