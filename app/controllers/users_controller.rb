class UsersController < ApplicationController
  # The set_run method is called before specific actions.
  before_action :set_user, only: %i[ show update ]

  # The show action which gets the page which shows the current user.
  # GET /users/1 or /users/1.json
  def show
  end

  # The new action which gets the page used to create a new user.
  # GET /users/new
  def new
    @user = User.new
  end

  # The create action which creates a user.
  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: t('.notice') }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Sets the current user.
    def set_user
      @user = User.find(params[:id])
    end

    # Creates the strong parameters for users.
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :emailAddress, :age)
    end
end
