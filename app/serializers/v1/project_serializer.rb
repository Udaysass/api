
module V1
  class ProjectSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :student_project

    def student
      {
        id: object.student.id,
        name: object.student.name
      }
    end
  end
end