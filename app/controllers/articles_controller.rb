class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    set_article
  end

  def new
    @article = Article.new
  end

  def edit
    set_article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = ['You made a new post!']
      # redirect_to "/articles/#{@article.id}"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    set_article

    if @article.update(article_params)
      flash[:success] = ['Article was successfully updated.']
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    set_article

    if @article.destroy
      flash[:warning] = ['Article was successfully deleted.']
      redirect_to articles_path
    else
      flash[:danger] = ['Article could not be deleted.']
      redirect_to articles_path
    end
  end

  private
    # Drys up code
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content)
    end
end
