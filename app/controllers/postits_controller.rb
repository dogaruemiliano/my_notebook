class PostitsController < ApplicationController
  before_action :set_postit, only: [:edit, :update]

  # Define a colors constant
  COLORS = ["#86A1DA", "#88D6BA", "#F23595", "#283139", "#FEE269"]

  def new
    @postit = Postit.new
  end

  def create
    # Create a new Postit using strong params
    @postit = Postit.new(postit_params)
    # Add a random color from the COLORS array
    @postit.color = COLORS.sample
    # Set Postit user to current user
    @postit.user = current_user

    # Save and check if successful
    if @postit.save
      # Redirect to postits#index
      redirect_to postits_path
      # Flash with a nice message to confirm action success
      flash[:alert] = "Postit created Modafucka!"
    end
  end

  def edit
    # Set post using id from params (before_action :set_postit)
  end

  def update
    # Set post using id from params (before_action :set_postit)
    # Update and check if postit was updated
    if @postit.update(postit_params)
      # Redirect to postits#index
      redirect_to postits_path
      # Flash with a nice message to confirm action success
      flash[:alert] = "Postit updated Modafucka!"
    end
  end

  def destroy
  end

  def show
  end

  def index
    @postit = Postit.new
    @postits = Postit.all
  end

  private

  def postit_params
    params.require(:postit).permit(:description)
  end

  def set_postit
    # Find Postit model using id from url params
    @postit = Postit.find(params[:id])
  end
end
