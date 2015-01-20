module Admin
  class ArticlesController < ApplicationController
    def index
      @articles = Article.all.order("title ASC").page params[:page]
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to admin_article_path(@article), notice: "Article Updated Successfully"
      else
        render :edit
      end

      respond_to do |format|
        if @article.update_attributes(article_params)
          format.html { redirect_to(admin_article_path(@article), notice: 'Article was successfully updated.') }
          format.json { respond_with_bip(@article) }
        else
          format.html { render action: "edit" }
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
