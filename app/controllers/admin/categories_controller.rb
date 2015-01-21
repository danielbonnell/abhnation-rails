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
      new_index = category_params[:display_index]

      # Check if update is for display_index
      if new_index && new_index > @category.display_index
        decremented_cat = Category.where("display_index > ?", new_index).first

        # Decrement display_index of previous category
        if !decremented_cat.nil?
          break unless decremented_cat.update_attributes(display_index: new_index - 1)
        end

        # Increment display_index of current category
        @category.assign_attributes(display_index: @category.display_index + 1)
      end

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

    # def up_index
    #   @category = Category.find(params[:id])
    #   # binding.pry
    #   Category.where("display_index > ?", @category.display_index).first.update(display_index: @category.display_index - 1)
    #   @category.update(display_index: @category.display_index + 1)
    #
    #   respond_to do |format|
    #     if @category.update_attributes(category_params)
    #       format.html { redirect_to(admin_categories_path(@categories), notice: 'Category was successfully updated.') }
    #       format.json { respond_with_bip(@category) }
    #     else
    #       format.html { render action: edit_admin_categories_path(@category) }
    #       format.json { respond_with_bip(@category) }
    #     end
    #   end
    # end
    #
    # def down_index
    # end

    private

    def category_params
      params.require(:category).permit(
        :display_index,
        :name,
        :parent_id,
        :user_id,
        :page
      )
    end
  end
end
