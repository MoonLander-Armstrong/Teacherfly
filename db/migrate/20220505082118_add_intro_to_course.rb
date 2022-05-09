class AddIntroToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :intro, :text 
  end
end
