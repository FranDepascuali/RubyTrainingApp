class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    return redirect_to @article if @article.save
    render 'new'
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
