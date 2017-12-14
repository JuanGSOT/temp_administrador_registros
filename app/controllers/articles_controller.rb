class ArticlesController < ApplicationController
  def index
    @articles = Article.all.where(live: true).order('name ASC')
    @article = Article.new
    
    if params[:id]
      @article_find = Article.find(params[:id])
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def modify
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.create(article_params)
    
    if @article.save
      flash[:notice] = "Nuevo material registrado."
    else
      flash[:alert] = "Algo salio mal al guardar!"
    end

    redirect_to articles_path
  end

  def update
    @article_find = Article.find(params[:id])
    
    if @article_find.update_attributes(article_params)
      flash[:notice] = "Los datos del material se han actualizado."
    else
      flash[:alert] = "Algo salio mal al actualizar!"
    end

    redirect_to articles_path
  end
 
  def destroy
    @article = Article.find(params[:id])
    @article.update(live: false)
    
    
    flash[:notice] = "Se ha eliminado satisfactoriamente."
    

    redirect_to articles_path
  end

private
  def article_params
    params.require(:article).permit(:name, :details, :description, :status, :maintenance)
  end
end
