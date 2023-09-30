class ApplicationController < ActionController::Base
  before_action :set_current_user

	def current_user
		@current_user
	end

	private

	def set_current_user
		@current_user = User.find(1)
	end
end
