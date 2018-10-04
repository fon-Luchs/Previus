class Api::ProfilesController < ApplicationController
  skip_before_action :authenticate!, only: :create

  before_action :build_resource, only: :create

  def show
    @profile = User.find(params[:id])
  end

  private

  def build_resource
    @user = User.new resource_params
  end

  def resource
    @user ||= current_user
  end

  def resource_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end
end
