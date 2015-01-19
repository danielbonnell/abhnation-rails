module Admin
  class ArticlesController < ApplicationController
    def index
      @articles = Article.all
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to @article, notice: "Article Updated Successfully"
      else
        render :edit
      end
    end

    def destroy
      @article = Article.find(params[:id])

      if @article.destroy
        redirect_to admin_articles_path, notice: "Article Successfully Deleted"
      end
    end

    private

    def article_params
      params.require(:review).permit(:title, :slug, :text, :category_id, :user_id)
    end
  end
end
