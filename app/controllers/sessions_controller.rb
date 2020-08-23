class SessionsController < ApplicationController
	def new
		# session[:user_id] = nil
	end

	def create
		if params.dig(:session, :username).empty? || params.dig(:session, :password).empty?
			respond_to { |f| f.js { render 'new_error_empty' } }
		else
			user = User.find_by(username: params.dig(:session, :username))

			if user
				@username = user.username

				if user.authenticate(params.dig(:session, :password))
					session[:user_id] = user.id
					flash[:notice] = "Hello #{@username}, you have successfully logged in!"
					redirect_to root_path
				else
					respond_to { |f| f.js { render 'new_error_pass' } }
				end
			else
				respond_to { |f| f.js { render 'new_error' } }
			end
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = 'You are successfully logged out'
		redirect_to root_path
	end

	private

	def set_user
	end

	def permit_user
	end
end
