class Api::TopicsController < ApplicationController
  before_action :set_forum, only: :create

  def show
    @topic = Topic.find(params[:id])
  end

  private

  def set_forum
    @forum = Forum.find(params[:forum_id])
  end

  def resource
    @topic = forum.topics.new resource_params
  end

  def resource_params
    params.require(:topic).permit(:title, :text)
  end
end
