module Admin
  class CategoriesController < ApplicationController
    def show
      @category = Category.find(params[:id])
      @subcategories = @category.subcategories
      @articles = @category.articles
    end

    def index
      @categories = Category.all.order("name ASC").page params[:page]
    end
  end
end
