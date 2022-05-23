class AddImageDataToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :image_data, :text
  end
end
