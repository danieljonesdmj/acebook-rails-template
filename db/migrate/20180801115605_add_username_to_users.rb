# frozen_string_literal: true

# Adding usernames to users
class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
