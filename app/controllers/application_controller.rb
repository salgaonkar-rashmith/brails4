class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def is_admin
    current_user.admin? if current_user
  end

  #TODO
  #should redirect to admin dashboard
  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_levels_path
    else
      current_user_path
    end
  end
end