class ArticlesController < ApplicationController

  before_action :set_article, only: %i[show edit update destroy]

  # antes de hacer show, edit, update y destroy, se hará un set_article, y luego la acción show o edit o update o destroy

  def show

    
    #  @article = Article.find(params[:id]) es lo mismo que poner por consola (article = Article.find(1))
    # se tiene que poner @article ara que "article" sea available para la vista "show"
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new 
    
    # @article = Article.new se tiene que poner porque cada vez que entramos en "new", la vista tiene un "@article" que no reconoce
    # si esto se queda vacío, entra en la vista "new" pero "@article" no existe porque se encuentra en "create"
    # por tanto hay que crear esta variable @article
  end

  def edit
    
    # sirve para poner /:d/edit, per una vez le damos a actualizar, la consola del server nos dice que no encuentra
    # un template para "update"

  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
    redirect_to @article
    else
      render 'edit'
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
    redirect_to @article
    else
      render 'new'
    end
  end

  def destroy

    @article.destroy
    redirect_to articles_path
  end

  private # todo lo que ponga aquí será visible para todos los métodos de este controlador únicamente.

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
