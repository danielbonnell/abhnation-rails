module Admin
  class ArticlesController < ApplicationController
    def new
      @article = Article.new
    end

    def create
      @article = Article.new(user: current_user)
      @article.attributes = article_params

      respond_to do |format|
        if @article.save
          format.html { redirect_to admin_articles_path, notice: "Success" }
          format.json { respond_with_bip(@category) }
        else
          format.html { redirect_to admin_articles_path, notice: "Failed" }
          format.json { respond_with_bip(@category) }
        end
      end
    end

    def index
      @articles = Article.all.order("title ASC").page params[:page]
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])

      respond_to do |format|
        if @article.update_attributes(article_params)
          format.html { redirect_to(admin_article_path(@article), notice: 'Article was successfully updated.') }
          format.json { respond_with_bip(@article) }
        else
          format.html { render action: edit_admin_article_path(@article) }
          format.json { respond_with_bip(@article) }
        end
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
      params.require(:article).permit(
        :title,
        :slug,
        :text,
        :category_id,
        :user_id,
        :page
      )
    end
  end
end
