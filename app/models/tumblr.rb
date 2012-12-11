class Tumblr < ActiveRecord::Base
  attr_accessible :followers, :title, :total_notes, :total_posts, :url
end
