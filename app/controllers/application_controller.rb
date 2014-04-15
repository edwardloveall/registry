class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  protect_from_forgery with: :exception

  def require_admin
    unless current_user.admin?
      redirect_to registry_root_path
    end
  end
end
