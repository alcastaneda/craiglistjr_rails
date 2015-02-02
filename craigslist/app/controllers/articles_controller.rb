class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def new
    @category_options = Category.all.map{|c| [ c.title, c.id ] }
    @article = Article.new
  end

  def create

    @article = Article.new(article_params)
    if @article.valid?
      @article.key = create_key
      @article.save
    end
    redirect_to "/articles/#{@article.id}/success"
  end

  def edit
    @article = Article.find(params[:id])
      if @article.key == params[:key]
       @category_options = Category.all.map{|c| [ c.title, c.id ] }
       edit_article_path(@article)

      else
        redirect_to article_path(@article)
      end
  end

  def update
    @article= Article.find(params[:id])
    @article.update_attributes(article_params)
    @category = @article.category
    redirect_to category_path(@category)
  end

  def destroy
    @article= Article.find(params[:id])
    @category = @article.category
    @article.destroy
    redirect_to category_path(@category)
  end

  def success
    @article = Article.find(params[:id])
  end

   private

   def article_params
      params.require(:article).permit(:title, :description, :price, :category_id)
   end

  def create_key
    @key = Faker::Internet.password(8)
    return @key
  end
end
