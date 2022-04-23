# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :set_project, only: %i[show edit update destroy]

      # GET /projects or /projects.json

      def index
        byebug
        projects = Project.all
        render json: {
        data: ActiveModelSerializers::SerializableResource.new(projects, each_serializer: ProjectSerializer),
        message: ['project list fetched successfully'],
        status: 200,
        type: 'Success'
      }
        # render json: projects, status: 200
      end

      # GET /projects/1 or /projects/1.json
      def show; end

      # GET /projects/new
      def new
        @project = Project.new
      end

      # GET /projects/1/edit
      def edit; end

      # POST /projects or /projects.json
      def create
        # @project = Project.new(name: params[:name],description: params[:description])
        @project = project.students.new(project_params)

          if @project.save
            # render json: @project, status: :created, location: students_path(@project)
            render json: projects, status: 200
          else
            # render json: @project, status: :created, location: students_path(@project)
            render json: projects, status: 404
          end
      end

      # PATCH/PUT /projects/1 or /projects/1.json
      def update
        # respond_to do |format|
          if @project.update(name: params[:name])
            # render json: @project, status: :created, location: students_path(@project)
            render json: @project, status: 200
          else
            # render json: @project, status: :created, location: students_path(@project)
            render json: @project, status: 404
          end
        # end
      end

      # DELETE /projects/1 or /projects/1.json
      def destroy
        @project.destroy

        # respond_to do |format|
          # format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
          # format.json { head :no_content }
        # end
        render json: @project, status: :created, location: students_path(@project)
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = Project.find_by_id params[:id]
        render json: {message: 'invalid id'}, status: 404 unless @project.present?
      end

      # Only allow a list of trusted parameters through.
      def project_params
        params.require(:project).permit(:name, :description )
      end
    end
  end
end
