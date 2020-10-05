# Data created in a before(:all) block is NOT rolled back after tests are done
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