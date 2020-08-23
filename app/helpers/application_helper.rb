module ApplicationHelper
	def flash_message_manager
		msg = flash[:notice] || flash[:alert] || flash[:error]
		notify(msg) if msg
	end

	def notify(msg, btn_msg = 'Ok')
		javascript_tag %Q[notify("#{msg}", "#{btn_msg}")]
	end
end
