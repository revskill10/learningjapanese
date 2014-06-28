class User < ActiveRecord::Base
	has_secure_password
	validates :fullname, :email, :presence => true
end
