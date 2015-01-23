module Admin
  class CategoriesController < ApplicationController
    def show
      @category = Category.find(params[:id])
    end

    def index
      @categories = Category.all.order("display_index ASC").page params[:page]
    end

    def edit
      @category = Category.find(params[:id])
    end

    def update
      @category = Category.find(params[:id])

      if params[:category][:reorder_categories] && @category.reorder(params[:category][:reorder_categories].to_i)
        reorder_category = true
      else
        reorder_category = false
        # binding.pry
      end

      respond_to do |format|
        if reorder_category
          format.html { redirect_to admin_categories_path, notice: "Success" }
          format.json { respond_with_bip(@category) }
        elsif @category.update_attributes(category_params)
          format.html { redirect_to admin_categories_path, notice: "Success" }
          format.json { respond_with_bip(@category) }
        else
          format.html { redirect_to admin_categories_path, notice: "Failed" }
          format.json { respond_with_bip(@category) }
        end
      end
    end

    def destroy
      @category = Category.find(params[:id])

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
        :reorder_categories,
        :display_index,
        :name,
        :parent_id,
        :user_id,
        :page
      )
    end
  end
end
