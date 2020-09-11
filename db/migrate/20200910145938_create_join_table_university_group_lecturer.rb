class CreateJoinTableUniversityGroupLecturer < ActiveRecord::Migration[6.0]
  def change
    create_join_table :university_groups, :lecturers do |t|
      # t.index [:university_group_id, :lecturer_id]
      # t.index [:lecturer_id, :university_group_id]
    end
  end
end
