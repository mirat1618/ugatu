class CreateQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaires do |t|
      t.integer :first_question
      t.integer :second_question
      t.integer :third_question
      t.integer :fourth_question
      t.integer :fifth_question
      t.integer :sixth_question
      t.integer :seventh_question
      t.references :lecturer, null: false, foreign_key: true
      t.references :university_group, null: false, foreign_key: true
      t.references :discipline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
