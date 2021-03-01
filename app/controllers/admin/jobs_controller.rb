module Admin
  class JobsController < Controller
    before_action :set_job, only: %i[ show edit update destroy ]

    def show
    end

    def edit
    end

    def create
      @job = current_profile.jobs.new(job_params)

      if @job.save
        redirect_to admin_experience_path, notice: "Job was successfully created."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def update
      @job.company_logo.purge if image_purge?
      if @job.update(job_params)
        redirect_to [:admin, @job], notice: "Job was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @job.destroy
      render turbo_stream: ""
    end

    private
      def set_job
        @job = current_profile.jobs.find(params[:id])
      end

      def job_params
        params.require(:job).permit(:company_name, :role, :description, :start_date, :end_date, :company_logo)
      end

      def image_purge?
        params.require(:job)[:company_logo_delete].present?
      end
  end

end
