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
    respond_to do |format|
      if @article.update_attributes(article_params)
        format.json { render @article }
        format.html { render :show }
      else
        format.json { render json: { error: error_response }.to_json, status: :unprocessible_entity }
        format.html { flash[:error] = @article.error unless flash[:error]; render :edit }
      end
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
