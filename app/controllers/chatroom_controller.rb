class ChatroomController < ApplicationController
	before_action :require_user

	def index
		flash[:error] = 'You are not logged in!'
		@messages = Message.all
	end

	def help
	end
end
