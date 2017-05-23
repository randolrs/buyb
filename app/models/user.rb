class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

 after_create :send_admin_mail

 after_create :send_simple_message
  

  def send_admin_mail

    UserMailer.send_welcome_message_to_user(self).deliver
  
  end


  def send_simple_message
    RestClient.post "https://api:key-a95c47f4d450dd505a41737d4ceace9b"
        "@api.mailgun.net/v3/sandbox6d94932b4dd342f1a283d5c0a34d0c0a.mailgun.org/messages",
        :from => "Mailgun Sandbox <postmaster@sandbox6d94932b4dd342f1a283d5c0a34d0c0a.mailgun.org>",
        :to => "Shane Randolph <r.shane.randolph@gmail.com>",
        :subject => "Hello Shane Randolph",
        :text => "Congratulations Shane Randolph, you just sent an email with Mailgun!  You are truly awesome!"
	end


end
