class CreateLecturers < ActiveRecord::Migration[6.1]
  def change
    create_table :lecturers do |t|
      t.string :name
      t.text :content
      t.string :headshot

      t.timestamps
    end
  end
end
