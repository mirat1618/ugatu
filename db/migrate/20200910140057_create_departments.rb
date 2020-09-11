class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :title
      t.string :abbreviation
      t.references :faculty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
