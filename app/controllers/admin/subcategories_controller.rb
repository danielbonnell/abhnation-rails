module Admin
  class SubcategoriesController < ApplicationController
    def show
      @subcategory = Subcategory.find(params[:id])
    end

    def index
      @subcategory = Subcategory.all
    end
  end
end
