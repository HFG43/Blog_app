class ApplicationController < ActionController::Base
  before_action :set_current_user

  attr_reader :current_user

  private

  def set_current_user
    @current_user ||= User.first
  end
end
