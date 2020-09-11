class CreateLecturers < ActiveRecord::Migration[6.0]
  def change
    create_table :lecturers do |t|
      t.string :fullname

      t.timestamps
    end
  end
end
