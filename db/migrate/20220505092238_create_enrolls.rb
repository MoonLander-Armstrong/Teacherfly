class CreateEnrolls < ActiveRecord::Migration[6.1]
  def change
    create_table :enrolls do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
