# frozen_string_literal: true

# Class for creating posts table in migration
class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :message

      t.timestamps
    end
  end
end
