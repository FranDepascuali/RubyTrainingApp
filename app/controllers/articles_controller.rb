class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    return redirect_to article if article.save
    render 'new'
  end

  def edit
    article
  end

  def update
    return redirect_to article if article.update(article_params)
    render 'edit'
  end

  def destroy
    article.destroy if article.present?
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def article
    @article ||= Article.find(params[:id])
  end
end
