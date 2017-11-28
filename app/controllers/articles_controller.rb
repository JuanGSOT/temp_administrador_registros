class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @article = Article.new
  end

  def new
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      flash[:notice] = "un nuevo articulo se ha registrado"
      redirect_to articles_path
    else
      flash[:alert] = "algo salio mal al guardar el articulo"
      redirect_to root_path
    end
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
