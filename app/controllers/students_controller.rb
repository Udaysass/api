# frozen_string_literal: true
class StudentsController < ApplicationController
  # before_action :authorize_request, except: :create
  # before_action :find_student, except: %i[create index]

  # before_action :authentication

  # GET /students
  def index
    @students = Student.all
    # render json: @students, status: :ok
    render json: @students, status: 200
  end

    def new
      byebug
      @student = Student.new 
      @student.student_projects.build
    end  

  # GET /students/{username}
  def show
    # render json: @student, status: :ok
    render json: @student, status: 200
  end

  # POST /students
  def create
    byebug
    @student = Student.new(student_params)
    if @student.save
      # render json: @student, status: :created
      render json: @student, status: 200
    else
      # render json: { errors: @student.errors.full_messages },
      #        status: :unprocessable_entity
      render json: @students, status: 404
    end
  end

  # PUT /students/{username}
  def update
    unless @student.update(student_params)
      render json: projects, status: 200
    end
  end

  # DELETE /students/{username}
  def destroy
    @student.destroy
    render json: projects, status: 200
  end

  private

  def find_student
    @student = Student.find_by_username!(params[:_username])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def student_params
      params[:student][:student_projects_attributes] = params[:student_projects_attributes]
    params.permit(
      :name, :username, :email, :password_digest, :password_digest, student_projects_attributes: [:submission_date]
    )
     # params.fetch(:student, {}).permit(:name, :username, :email, :password_digest, student_projects_attributes: [:submission_date])
  end
end
