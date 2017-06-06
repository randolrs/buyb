class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

 after_create :send_admin_mail

  def send_admin_mail

    UserMailer.send_welcome_message_to_user(self).deliver
  
  end

  def personal_settings

  	settings = PersonalSetting.where(:user_id => self.id).last

  	if settings

  		return settings
  	else

  		return nil

  	end

  end




end
