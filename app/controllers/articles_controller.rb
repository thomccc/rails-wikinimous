class ArticlesController < ApplicationController
  def index         # GET articles/
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id]) # GET /articles/:id
  end

  def new
    @article = Article.new         # GET /articles/new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to articles_path(@article)       # POST /articles
  end

  def edit
    @article = Article.find(params[:id])      # GET /articles/:id/edit
  end

  def update
    @article = Article.find(params[:id])
    @article.update(task_params)

    redirect_to articles_path(@article)        # PATCH /articles/:id
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path       # DELETE /articles/:id
  end


  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end


