class Api::DiscussionsController < ApplicationController
  before_action :set_user, only: :create
  before_action :set_topic, only: :create

  private

  

  def resource
    @discussion = Discussion.new resource_params
  end

  def resource_params
    params.require(:discussion).permit(:comment, :user_id, :topic_id)
  end
end
