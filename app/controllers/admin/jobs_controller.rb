module Admin
  class JobsController < ApplicationController
    before_action :set_job, only: %i[ show edit update destroy ]

    def show
    end

    def new
      @job = Job.new
    end

    def edit
    end

    def create
      @job = Job.new(job_params)

      if @job.save
        redirect_to [:admin, @job], notice: "Job was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @job.update(job_params)
        redirect_to [:admin, @job], notice: "Job was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @job.destroy
      head :ok
    end

    private
      def set_job
        @job = Job.find(params[:id])
      end

      def job_params
        params.require(:job).permit(:company_name, :role, :description, :start_date, :end_date, :profile_id)
      end
  end

end
