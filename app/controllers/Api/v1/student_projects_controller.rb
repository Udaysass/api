module Api
  module V1
    class StudentProjectsController < ApplicationController
      # def index

      #   student_projects = StudentProject.all.includes(:student)
      #   render json: {
      #   data: ActiveModelSerializers::SerializableResource.new(student_projects, each_serializer: StudentProjectSerializer),
      #   message: ['student project list fetched successfully'],
      #   status: 200,
      #   type: 'Success'
      # }
      #   # render json: projects, status: 200
      # end

    def create
    byebug
    @student_project = StudentProject.new(student_project_params)
      if @student_project.save
        # render json: @student, status: :created
        render json: @student_projects, status: 200
      else
        # render json: { errors: @student.errors.full_messages },
        #        status: :unprocessable_entity
        render json: @students, status: 404
      end
    end

    private

      # Use callbacks to share common setup or constraints between actions.
      # def set_project
      #   @project = Project.find_by_id params[:id]
      #   render json: {message: 'invalid id'}, status: 404 unless @project.present?
      # end

      # Only allow a list of trusted parameters through.
      def student_project_params
        params.require(:student_project).permit(:submission_date, :student_id, :project_id )
      end

    end 
  end 
end    
