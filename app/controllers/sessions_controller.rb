require 'open-uri'
require 'json'

class SessionsController < ApplicationController

  def new
    services = ['tumblr', 'google_oauth2'] 
    links = services.sort.map{|service| "<li style='margin: 15px;'><a href='/auth/#{service}'>#{service}</a></li>" }
    render :text => "Authenticate with: <ul style='font-size: 20pt;'>#{links.join}</ul>", :layout => true
  end
  
  def create

    # Authorization is hard coded, this should change for github and production
    api_key = 'TweXE95LL6PcUVMmbOic8RcYy2fkV3GLl9O3Y5pjfRrXrrR4Gk'
    @tumblr_account_raw = request.env["omniauth.auth"].to_json
    @tumblr_account = JSON.parse(@tumblr_account_raw)

    # raise @tumblr_account.flatten.inspect
    #render :json => @tumblr_account

    # The Blog URL will be provided by the user, so this will be dynamic 
    blog_url = 'chicagohistorymuseum.tumblr.com'

    # Basic Tumblr blog info Title, URL, and Followers
    @tumblr_account["extra"]["raw_info"]["blogs"].each do |blog|
      @tumblr_blog_title = blog["title"]
      @tumblr_blog_url = blog["url"]
      @tumblr_blog_followers = blog["followers"]
    end

    # After authorization this is the blog account information returned from Tumblr
    @tumblr_posts_info = JSON.parse(open("http://api.tumblr.com/v2/blog/#{blog_url}/posts?api_key=#{api_key}&notes_info=true&limit=1").read)
    @tumblr_total_posts = @tumblr_posts_info["response"]["blog"]["posts"]
  
    # All of the user's posts for one blog
    count = 0 
    @tumblr_posts_all = []
    while count < @tumblr_total_posts
      @tumblr_posts = JSON.parse(open("http://api.tumblr.com/v2/blog/#{blog_url}/posts?api_key=#{api_key}&offset=#{count}&limit=45").read)
      @tumblr_posts_all << @tumblr_posts["response"]["posts"] if @tumblr_posts["response"]["posts"].present?
      count += 45
    end

    # All of the notes information for one blog (Total, Post Average)
     @tumblr_posts_all = @tumblr_posts_all.flatten!
     @tumblr_total_notes = 0
     @tumblr_posts_all.each {|notes| @tumblr_total_notes += notes["note_count"]}
     @tumblr_avg_notes_per_post = @tumblr_total_notes / @tumblr_total_posts

  end

  def failure
    render :text => "FAIL!"
  end

  def destroy

  end

end

# http://api.tumblr.com/v2/blog/heffilumpotamus.tumblr.com/posts?api_key=TweXE95LL6PcUVMmbOic8RcYy2fkV3GLl9O3Y5pjfRrXrrR4Gk&notes_info=true&limit=2

#http://api.tumblr.com/v2/blog/chicagohistorymuseum.tumblr.com/followers?api_key=TweXE95LL6PcUVMmbOic8RcYy2fkV3GLl9O3Y5pjfRrXrrR4Gk&access_token=SUCiETaZgOWWG2Qbna8HNlm7gEjQiBW8c12jbPES95rLvdrxji&secret=T5vyWqgRqWBpKRs5wf1PXtU09UmFZ9HnIX5XLWsv6GOVvA2RwV

