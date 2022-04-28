class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :title
      t.string :published, default: "draft"
      t.boolean :finished, default: false
      t.text :content

      t.timestamps
    end
  end
end
