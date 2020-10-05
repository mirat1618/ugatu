class UniversityGroupSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :faculty_id, :department_id
end