module Admin
  class PagesController < Controller
    before_action :set_page, only: %i[edit show update destroy]

    def index
      pages = current_profile.pages
      @pages = pages.all
      @page = @pages.active.first
    end

    def show
    end

    def new
      @page = current_profile.pages.new
    end

    def edit
    end

    def create
      @page = current_profile.pages.new(page_params)

      respond_to do |format|
        if @page.save
          format.html { redirect_to [:admin, @page], notice: "Page was successfully created." }
          format.json { render :show, status: :created, location: @page }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @page.update(page_params)
          format.html { redirect_to [:admin, @page], notice: "Page was successfully updated." }
          format.json { render :show, status: :ok, location: @page }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
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
        params.require(:page).permit(:summary, :about_title, :about_text, :services_title, :projects_title, :contact_title, :contact_number, :active)
      end
  end

end
