class Api::DiscussionsController < ApplicationController
  private

  def resource
    @discussion = current_user.discussions.new resource_params
  end

  def resource_params
    params.require(:discussion).permit(:comment, :topic_id)
  end
end
