class AnnotationsController < ApplicationController
  before_filter :parse_facebook_cookies

  def parse_facebook_cookies
    @facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
  end

  def privacy
  end

  # GET /annotations/new
  # GET /annotations/new.json
  def new
    unless @facebook_cookies.nil? || cookies[:facebook_completed]
      Delayed::Job.enqueue ::Parser.new(@facebook_cookies["access_token"])
      cookies[:facebook_completed] = true
    end

    @annotation = Annotation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @annotation }
    end
  end

  # POST /annotations
  # POST /annotations.json
  def create
    @annotation = Annotation.create!(params[:annotation])
    cookies[:completed] = { :value => true, :expires => 1.year.from_now }

    respond_to do |format|
      format.html { redirect_to '/' }
    end
  end
end
