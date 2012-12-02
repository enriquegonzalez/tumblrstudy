class User < ActiveRecord::Base
  attr_accessible :email, :tumblr_secret, :tumblr_token


	def self.from_omniauth(auth, tumblr_token, tumblr_secret)
		where(uid: auth.uid).first || create_from_omniauth(auth, tumblr_token, tumblr_secret)
	end


	def self.create_from_omniauth(auth, google_token, google_secret)
		user = User.new
		user.uid = auth.uid
		user.save
		@user = user
	end


end
