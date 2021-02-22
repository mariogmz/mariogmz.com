module Admin
  class ProjectsController < Controller
    before_action :set_page, only: %i[create]
    before_action :set_project, only: %i[show edit update destroy]

    def show
    end

    def edit
    end

    def create
      @project = Project.new(project_params)

      if @project.save
        redirect_to edit_admin_page_path(@page), notice: "Project was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @project.update(project_params)
        redirect_to [:admin, @project]
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @project.destroy
      head :no_content
    end

    private
      def set_project
        @project = Project.find(params[:id])
      end

      def project_params
        params.require(:project).permit(:name, :url, :description, :page_id)
      end

      def set_page
        @page = Page.find(params[:page_id])
      end
  end
end
