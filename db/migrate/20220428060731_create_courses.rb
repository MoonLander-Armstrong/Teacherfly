class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :content
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
