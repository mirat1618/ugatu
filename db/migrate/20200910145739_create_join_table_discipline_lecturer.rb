class CreateJoinTableDisciplineLecturer < ActiveRecord::Migration[6.0]
  def change
    create_join_table :disciplines, :lecturers do |t|
      # t.index [:discipline_id, :lecturer_id]
      # t.index [:lecturer_id, :discipline_id]
    end
  end
end
