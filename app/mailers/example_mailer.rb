class ExampleMailer < ApplicationMailer
	
	default from: "Shane@thatHQ.com"

	def sample_email(user)
    	@user = user
    	mail(to: @user.email, subject: 'Welcome to thatHQ')
  	end

end
