class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  
  def new
    @article = Article.new
  end

  # crUd
  def edit
    @article = Article.find(params[:id])
  end

  # Crud
  def create
    @article = Article.new(article_params)

    # inside the create action we use render instead of redirect_to when save returns false after we made validation.
    if @article.save
      redirect_to @article
    else 
      # The render method is used so that the @article object is passed back to the new template when it is rendered
      render 'new'
    end
  end
  
  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  private
    def article_params
      #whitelist our controller parameters to prevent wrongful mass assignment by using require and permit.
      params.require(:article).permit(:title, :text) 
    end

end
