class ApplicationController < ActionController::API
  include Graphiti::Rails::Responders

  def current_user
    @current_user ||= User.first
  end
end
