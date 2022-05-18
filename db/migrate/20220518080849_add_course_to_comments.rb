class AddCourseToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :course, null: false, foreign_key: true
  end
end
