class Api::ProfilesController < ApplicationController
  skip_before_action :authenticate!, only: :create
  skip_before_action :verify_authenticity_token, only: :create

  private

  def resource_param
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation
    )
  end

  def resource
    @user = User.new resource_param
  end
end
