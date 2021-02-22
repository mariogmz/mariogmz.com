module Admin
  class ServicesController < Controller
    before_action :set_page, only: %i[create]
    before_action :set_service, only: %i[show edit update destroy]

    def show
    end

    def edit
    end

    def create
      @service = Service.new(service_params)

      if @service.save
        redirect_to edit_admin_page_path(@page), notice: "Service was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @service.update(service_params)
        redirect_to [:admin, @service]
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @service.destroy
      head :no_content
    end

    private
      def set_service
        @service = Service.find(params[:id])
      end

      def service_params
        params.require(:service).permit(:name, :description, :page_id)
      end

      def set_page
        @page = Page.find(params[:page_id])
      end
  end

end
