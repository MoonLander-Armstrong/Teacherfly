class AddMediaDataToSections < ActiveRecord::Migration[6.1]
  def change
    add_column :sections, :media_data, :text
  end
end
