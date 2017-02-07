class ArticlesController < ApplicationController
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]

  # READ
  def index
    @articles = Article.all
  end

  def show
  end

  # CREATE
  def new
    @article = Article.new
  end

  def create
    article = Article.create(article_params)
    redirect_to article_path(article)
  end

  # UPDATE
  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  # DESTROY
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:name, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
