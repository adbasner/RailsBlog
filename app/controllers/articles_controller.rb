class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    set_article
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    set_article
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = 'You made a new post!'
      # redirect_to "/articles/#{@article.id}"
      redirect_to article_path(@article)
    else
      flash[:warning] = @article.errors.full_messages
      render 'new'
    end
  end

  def update
    set_article

    if @article.update(article_params)
      flash[:success] = 'Article was successfully updated.'
      redirect_to article_path(@article)
    else
      flash[:warning] = @article.errors.full_messages
      render 'edit'
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    set_article

    if @article.destroy
      flash[:success] = 'Article was successfully deleted.'
      redirect_to articles_path
    else
      flash[:warning] = 'Article could not be deleted.'
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
