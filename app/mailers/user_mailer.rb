class UserMailer < ApplicationMailer

	default from: "Shane@thatHQ.com"

	def send_welcome_message_to_user(user)
		# @user = user
		# mail(:to => @user.email, :subject => "Welcome!")
	end

end
