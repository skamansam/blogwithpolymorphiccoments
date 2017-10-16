class ArticlesController < ApplicationController
    # http_basic_authenticate_with name: "izak", password: "secret", except: [:index, :show]
 before_action :authenticate_admin!
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    #render plain: params[:article].inspect
    #params[:article] contains the attributes 
    #we're interested in
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      #This rendering is done within the same 
      #request as the form submission, whereas 
      #the redirect_to will tell the browser to 
      #issue another request.
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
  
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
   
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title,:text)
    end
end
