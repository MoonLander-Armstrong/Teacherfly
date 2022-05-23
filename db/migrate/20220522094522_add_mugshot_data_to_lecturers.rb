class AddMugshotDataToLecturers < ActiveRecord::Migration[6.1]
  def change
    add_column :lecturers, :mugshot_data, :text
  end
end
