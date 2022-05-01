class AddChapterIdToSections < ActiveRecord::Migration[6.1]
  def change
    add_reference :sections, :chapter, null: false, foreign_key: true
  end
end
