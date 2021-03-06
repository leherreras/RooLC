# frozen_string_literal: true

# Add gender to user
class AddGenderFieldToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :gender, :integer, null: false, default: 0
  end
end
