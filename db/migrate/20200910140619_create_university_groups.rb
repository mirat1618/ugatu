class CreateUniversityGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :university_groups do |t|
      t.string :title
      t.references :department, null: false, foreign_key: true
      t.references :faculty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
