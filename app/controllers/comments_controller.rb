class CommentsController < ApplicationController
  http_basic_authenticate_with name: Rails.application.secrets.user,
                               password: Rails.application.secrets.password, only: :destroy
  def create
    @comment = Comment.new(comment_params.merge(article: article))
    return redirect_to article_path(article) if @comment.save
    render 'articles/show'
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    return redirect_to article_path(article) if @comment.destroyed?
    render 'articles/show'
  end

  private

  def article
    @article ||= Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
