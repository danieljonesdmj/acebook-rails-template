# frozen_string_literal: true

# Class adding user_id
class AddUserIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user, foreign_key: true
  end
end
