class SessionsController < ApplicationController
  def signup
    student = Student.new(email: params[:email], password_digest: params[:password_digest], username: params[:username])

    # if user is saved
    if student.save
      # we encrypt user info using the pre-define methods in application controller
      token = encode_student_data({ student_data: student.id })

      # return to user
      render json: { token: token }
    else
      # render error message
      render json: { message: "invalid credentials" }
    end
  end

  def login
    student = Student.find_by(email: params[:email])

    # you can use bcrypt to password authentication
    if student && student. password_digest == params[:password_digest]

      # we encrypt user info using the pre-define methods in application controller
      token = encode_student_data({ student_data: student.id })

      # return to user
      render json: { token: token }
    else
      render json: { message: "invalid credentials" }
    end
  end
end 