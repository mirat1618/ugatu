class CreateJoinTableDepartmentLecturer < ActiveRecord::Migration[6.0]
  def change
    create_join_table :departments, :lecturers do |t|
      # t.index [:department_id, :lecturer_id]
      # t.index [:lecturer_id, :department_id]
    end
  end
end
