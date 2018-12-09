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
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      flash[:success] = 'Article was updated successfully'
      redirect_to article_path(@article)
    else
      flash[:warning] = @article.errors.full_messages
      render 'edit'
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content)
    end
end
