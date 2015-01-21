module Admin
  class CategoriesController < ApplicationController
    def show
      @category = Category.find(params[:id])
    end

    def index
      @categories = Category.all.order("name ASC").page params[:page]
    end

    def edit
      @category = Category.find(params[:id])
    end

    def update
      @category = Category.find(params[:id])

      # if @article.update(category_params)
      #   redirect_to admin_category_path(@category), notice: "Category Updated Successfully"
      # else
      #   render edit_admin_category_path(@category)
      # end

      respond_to do |format|
        if @category.update_attributes(category_params)
          format.html { redirect_to(admin_categories_path(@categories), notice: 'Category was successfully updated.') }
          format.json { respond_with_bip(@category) }
        else
          format.html { render action: edit_admin_categories_path(@category) }
          format.json { respond_with_bip(@category) }
        end
      end
    end

    def destroy
      @category = Category.find(params[:id])

      # if @article.destroy
      #   redirect_to admin_categories_path, notice: "Category Successfully Deleted"
      # end
      unless @category.dependents?
        respond_to do |format|
          if @category.destroy
            format.html { redirect_to(admin_categories_path(@categories), notice: 'Category was successfully deleted.') }
            format.json { respond_with_bip(@category) }
          else
            format.html { render action: edit_admin_categories_path(@category) }
            format.json { respond_with_bip(@category) }
          end
        end
      end
    end

    private

    def category_params
      params.require(:category).permit(
        :name,
        :parent_id,
        :user_id,
        :page
      )
    end
  end
end
