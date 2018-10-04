class Api::TopicsController < ApplicationController
  before_action :set_user, only: :create

  def show
    @topic = Topic.find(params[:id])
  end

  private

  def set_user
    @user = current_user
  end

  def resource
    @topic = @user.topics.new resource_params
  end

  def resource_params
    params.require(:topic).permit(:title, :text, :forum_id)
  end
end
