class ApplicationController < ActionController::API

  SECRET = "yoursecretword"

  def authentication
    # making a request to a secure route, token must be included in the headers
    decode_data = decode_student_data(request.headers["token"])
    # getting user id from a nested JSON in an array.
    student_data = decode_data[0]["student_data"] unless !decode_data
    # find a user in the database to be sure token is for a real user
    student = Student.find(student_data)

    # The barebone of this is to return true or false, as a middleware
    # its main purpose is to grant access or return an error to the user

    if student
      return true
    else
      render json: { message: "invalid credentials" }
    end
  end

  # turn user data (payload) to an encrypted string  [ A ]
  def encode_student_data(payload)
    token = JWT.encode payload, SECRET, "HS256"
    return token
  end

  # turn user data (payload) to an encrypted string  [ B ]
  def encode_student_data(payload)
    JWT.encode payload, SECRET, "HS256"
  end

  # decode token and return user info, this returns an array, [payload and algorithms] [ A ]
  def decode_student_data(token)
    begin
      data = JWT.decode token, SECRET, true, { algorithm: "HS256" }
      return data
    rescue => e
      puts e
    end
  end  

end
