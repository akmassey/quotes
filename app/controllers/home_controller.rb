require 'fortune'

class HomeController < ApplicationController
  def index
    @users = User.all
    unless params[:fortune].nil?
      fortune = Fortune.new(params[:fortune])
      quotes = fortune.quotes
      @found = "Why not?"
    else
      @found = "Nil fortunes for everyone"
    end
  end
end
