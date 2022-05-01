# frozen_string_literal: true

class AddUserIdToChapters < ActiveRecord::Migration[6.1]
  def change
    add_reference :chapters, :user, null: false, foreign_key: true
  end
end
