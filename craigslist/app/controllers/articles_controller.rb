class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def new
    @category_options = Category.all.map{|c| [ c.title, c.id ] }
    @article = Article.new

  end
end
