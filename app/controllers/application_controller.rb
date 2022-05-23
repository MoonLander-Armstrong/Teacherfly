# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  # rescue_from ActiveRecord::RecordNotFound, with: :not_found
  before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # rescue_from Pundit::NotAuthorizedError, with: :no_permission
  # rescue_from Pundit::InvalidConstructorError, with: :no_permission

  def after_sign_in_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  private
  def no_permission
    not_found
  end

  def not_found
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end
end
