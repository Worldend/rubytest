class HomeController < ApplicationController
  def index
      @articles = Article.all
  end

  def create
	# render plain: params[:article].inspect
  end
end
