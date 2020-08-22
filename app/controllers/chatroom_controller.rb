class ChatroomController < ApplicationController
	def index
		@messages = Message.all
	end

	def help
	end
end
