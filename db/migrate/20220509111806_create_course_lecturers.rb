class CreateCourseLecturers < ActiveRecord::Migration[6.1]
  def change
    create_table :course_lecturers do |t|
      t.references :course, null: false, foreign_key: true
      t.references :lecturer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
