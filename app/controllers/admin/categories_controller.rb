module Admin
  class CategoriesController < Controller
    before_action :set_category, only: %i[show edit update destroy]

    def show
    end

    def edit
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to admin_experience_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def update
      if @category.update(category_params)
        redirect_to [:admin, @category]
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @category.destroy
      render turbo_stream: turbo_stream.remove(@category)
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(
        :order, :name
      )
    end
  end
end
