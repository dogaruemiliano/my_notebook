class PostitsController < ApplicationController
  def new
    @postit = Postit.new
  end

  def create
    @color = ["#86A1DA", "#88D6BA", "#F23595", "#283139", "#FEE269"]
    @postit = Postit.new(description: params[:postit][:description], color: @color.sample)
    if @postit.save
      redirect_to postits_path
      flash[:alert] = "Postit created Modafucka!"
    end
  end

  def edit
  end

  def update
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
    params.require(:postit).permit(:description, color: @color.sample)
  end
end
