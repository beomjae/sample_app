class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			# Signin the user in and redirect to the user's show page
		else
			#create an error messsage and re-render the signin form.
			flash[:error].now = 'Invalid email/password combination' # Not quite right!
			render 'new'
		end
	end

	def destroy
	end
end
