class CreateReads < ActiveRecord::Migration[6.1]
  def change
    create_table :reads do |t|
      t.references :user, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
      t.integer :course_id
      t.boolean :finished, default: false

      t.timestamps
    end
  end
end
