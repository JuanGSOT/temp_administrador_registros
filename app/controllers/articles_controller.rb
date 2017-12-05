class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @article = Article.new
    if params[:id]
      @article_find = Article.find(params[:id])
    end
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

  def update
    @article_find = Article.find(params[:id])
    
    if @article_find.update_attributes(article_params)
      flash[:notice] = "Articulo actualizado."
      redirect_to articles_path
    else
      flash[:alert] = "algo salio mal al actualizar!"
      redirect_to root_path
    end
  end
 
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    flash[:alert] = "Se ha eliminado satisfactoriamente."
    redirect_to articles_path
  end
private
  def article_params
    params.require(:article).permit(:name, :details, :description, :status)
  end
end
