class AddFirstKataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_kata, :string
  end
end
