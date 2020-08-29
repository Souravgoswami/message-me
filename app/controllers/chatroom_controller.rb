class ChatroomController < ApplicationController
	before_action :require_user

	def index
		@message = Message.new
		@messages = Message.infinite_scroll_paginate
	end

	def help
	end
end
