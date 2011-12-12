require 'fortune'

class HomeController < ApplicationController
  def index
    @users = User.all
    unless params[:fortune].nil?
      fortune = Fortune.new(params[:fortune])
      @found = "It appears to have been successful."
    else
      @found = "Nil fortunes for everyone"
    end
  end
end
