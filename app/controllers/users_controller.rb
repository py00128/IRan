class UsersController < ApplicationController
  # The user must sign in before any of the actions.
  before_action :authenticate_user!
  # The set_run method is called before all actions.
  before_action :set_user

  # The show action which gets the page which shows the current user.
  # GET /users/1 or /users/1.json
  def show
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
