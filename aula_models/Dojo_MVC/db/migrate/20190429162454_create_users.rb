class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :email
      t.date :DN
      t.string :gender
      t.decimal :level
      t.string :classe
      t.string :birth_place

      t.timestamps
    end
  end
end
