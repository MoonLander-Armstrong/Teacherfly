class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :courses, :status, :published
  end
end
