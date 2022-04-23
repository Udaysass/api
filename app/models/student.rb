class Student < ApplicationRecord
	has_many :student_projects
  	has_many :projects , through: :student_projects
  	accepts_nested_attributes_for :student_projects, allow_destroy: true
end
