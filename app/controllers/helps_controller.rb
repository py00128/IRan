class HelpsController < ApplicationController
  # GET /helps/new
  def new
    @help = Help.new
  end

  # POST /helps or /helps.json
  def create
    @help = Help.new(help_params)

    respond_to do |format|
      if @help.save
        format.html { redirect_to root_path, notice: "Help was successfully created." }
        format.json { render :show, status: :created, location: root_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @help.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def help_params
      params.require(:help).permit(:name, :email, :message)
    end
end
