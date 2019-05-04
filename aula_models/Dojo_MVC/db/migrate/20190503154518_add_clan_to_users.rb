class AddClanToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :clan, foreign_key: true
  end
end
