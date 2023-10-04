class ApplicationController < ActionController::Base
  before_action :require_login

  private

  
  def require_login
    @require_login = 
  end
end
