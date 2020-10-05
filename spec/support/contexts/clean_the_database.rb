# Since requests test do not clean the database automatically unlike model tests, we have to do it by ourselves
RSpec.shared_context 'clean the database' do
  after(:all) do
    User.destroy_all
    Questionnaire.destroy_all
    Department.destroy_all
    Faculty.destroy_all
    Lecturer.destroy_all
    UniversityGroup.destroy_all
    Discipline.destroy_all
  end
end