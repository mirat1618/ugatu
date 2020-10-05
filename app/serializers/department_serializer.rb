class DepartmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :abbreviation, :faculty_id
end