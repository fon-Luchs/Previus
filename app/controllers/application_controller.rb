class ApplicationController < ActionController::Base
  attr_reader :current_user

  helper_method :collection, :resource

  def create
    render :errors unless resource.save
  end

  def destroy
    resource.destroy
  end

  rescue_from ActionController::ParameterMissing do |exception|
    @exception = exception

    render :exception, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound do
    @exception = 'Not Found'

    render :exception, status: :not_found
  end

  rescue_from ActiveRecord::RecordInvalid, ActiveModel::StrictValidationFailed do
    render :errors, status: :unprocessable_entity
  end
end
