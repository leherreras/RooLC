class AddGenderFieldToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :gender, :string, null: false, default: 'male'
  end
end
