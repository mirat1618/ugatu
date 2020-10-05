class FacultySerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :abbreviation
end