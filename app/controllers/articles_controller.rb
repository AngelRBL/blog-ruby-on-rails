class ArticlesController < ApplicationController
  # only: [:edit, :update, :show, :destory]
  # Aqui mandamos a llamar el article.find en todos los metodos excepto new, create y index
  before_action :find_article, except: [:new, :create, :index]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def edit
  end

  def update
    @article.update(title: params[:article][:title], content: params[:article][:content])

    redirect_to @article
  end
  
  def new 
    # Lo que este metodo hace es crear un nuevo articulo vacio
    # Una variable sin el @ solo se puede utilizar dentro del metodo mismo
    # y una variable con el @ se puede acceder desde la vista que esta mandando a llamar la accion new
    @article = Article.new
    # @article.title = 'Demo'
  end

  def create
    # lo que hace este esta linea de codigo es crear un articulo de este usuario
    @article = current_user.articles.create(title: params[:article][:title], content: params[:article][:content])
    # @article = Article.create(title: params[:article][:title], content: params[:article][:content], user: current_user)
    # render json: @article
    redirect_to @article
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end
  
  def find_article
    @article = Article.find(params[:id])
  end
  
end
