class Authorization < ActiveRecord::Base
  attr_accessible :provider, :secret, :token, :uid
end
