class AddSlugToSections < ActiveRecord::Migration[6.1]
  def change
    add_column :sections, :slug, :string
    add_index :sections, :slug, unique: true
  end
end
