class ApplicationController < ActionController::Base

	private

	def current_company
		@current_company ||= current_user.company if user_signed_in?
	end

	helper_method :current_company
end
