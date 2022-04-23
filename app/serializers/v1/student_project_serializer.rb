
module V1
  class StudentProjectSerializer < ActiveModel::Serializer
    attributes :id, :student

    def student
      {
        id: object.student.id,
        name: object.student.name
        username: object.student.username
      }
    end
  end
end