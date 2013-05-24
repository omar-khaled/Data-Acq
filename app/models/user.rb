class User < ActiveRecord::Base
  
	attr_accessible  :email, :password, :password_confirmation, :name
  	acts_as_authentic do |c|
    	 c.login_field = 'email'
    	 c.logged_in_timeout = 30.minutes
 		#c.validate_email_field = false
 		#c.validate_password_field = false
  	end 
end
