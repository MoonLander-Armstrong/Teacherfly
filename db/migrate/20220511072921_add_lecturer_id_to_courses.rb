class AddLecturerIdToCourses < ActiveRecord::Migration[6.1]
  def change
    add_reference :courses, :lecturer, null: false, foreign_key: true
  end
end
