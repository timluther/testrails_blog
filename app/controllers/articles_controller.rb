class ArticlesController < ApplicationController

	http_basic_authenticate_with(name: "dhh", password: "secret", except: [:index, :show])
 
    def index
	    @articles = Article.all
	    respond_to do |format|
	    	format.html
	    	format.xml {render :xml => @articles}
	    	format.json {render :json => @articles}
	    end
  	end


	def new
		@article = Article.new
	end

	def create
		puts "In create article"
  		@article = Article.new(article_params)  		

  		if @article.save 
  			#edirect_to @article 
  			respond_to do |format|  			
		   		format.html {redirect_to @article}
		   		format.xml {render :xml => @articles}
	    		format.json {render :json => @articles}
	    	end	
  		else 
  			render 'new'
  		end
  			  	
	end



	def show
  		@article = Article.find(params[:id])
	end

	def edit
  		@article = Article.find(params[:id])
	end

	def index
  		@articles = Article.all
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
			params.require(:article).permit(:title, :text)
		end
end