class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

private
  def article_params
    params.require(:article).permit(:name, :details, :description, :status)
  end
end
