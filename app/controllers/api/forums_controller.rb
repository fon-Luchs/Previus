class Api::ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end

  def show
    @forum = Forum.find(params[:id])
  end

  private

  def resource
    @forum = Forum.new resource_params
  end

  def resource_params
    params.require(:forum).permit(:title)
  end
end
