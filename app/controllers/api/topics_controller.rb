class Api::TopicsController < ApplicationController

  def show
    @topic = Topic.find(params[:id])
  end

  private

  def resource
    @topic = Topic.new resource_params
  end

  def resource_params
    params.require(:topic).permit(:title, :text)
  end

end
