class CreateLecturers < ActiveRecord::Migration[6.1]
  def change
    create_table :lecturers do |t|
      t.string :name
      t.string :nickname
      t.text :content

      t.timestamps
    end
  end
end
