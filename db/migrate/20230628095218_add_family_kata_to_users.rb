class AddFamilyKataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :family_kata, :string
  end
end
