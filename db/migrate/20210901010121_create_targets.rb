# frozen_string_literal: true

class CreateTargets < ActiveRecord::Migration[6.1]
  def change
    create_table :targets do |t|
      t.string :title, null: false
      t.float :radius, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.references :topic, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :targets, :title
  end
end
