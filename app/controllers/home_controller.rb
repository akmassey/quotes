require 'fortune_parser'

class HomeController < ApplicationController
  def index
    @users = User.all
    unless params[:fortune].nil?
      FortuneParser.new(params[:fortune])
      @found = "Why not?"
    else
      @found = "Nil fortunes for everyone"
    end
  end
end
