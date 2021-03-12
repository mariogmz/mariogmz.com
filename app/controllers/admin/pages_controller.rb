module Admin
  class PagesController < Controller
    before_action :set_page, only: %i[edit show update destroy purge_image]

    def index
      pages = current_profile.pages
      @active_page = pages.active.first
      @pages = pages.where.not(id: @active_page)
    end

    def show
    end

    def new
      @page = current_profile.pages.new
    end

    def edit
      @new_service = @page.services.build
      @new_project = @page.projects.build
    end

    def create
      @page = current_profile.pages.new(page_params)

      if @page.save
        redirect_to edit_admin_page_path(@page), notice: "Page was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @page.update(page_params)
        purge_images
        redirect_to edit_admin_page_path(@page)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @page.destroy
      respond_to do |format|
        format.html { redirect_to admin_pages_url, notice: "Page was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      def set_page
        @page = current_user.profile.pages.find(params[:id])
      end

      def page_params
        params.require(:page).permit(
          :summary,
          :about_title,
          :services_title,
          :projects_title,
          :contact_title,
          :contact_number,
          :active,
          :hero_image,
          :about_image,
          :contact_image
        )
      end

      def purge_images
        @page.hero_image.purge if params.require(:page)[:hero_image_delete].present?
        @page.about_image.purge if params.require(:page)[:about_image_delete].present?
        @page.contact_image.purge if params.require(:page)[:contact_image_delete].present?
      end
  end

end
