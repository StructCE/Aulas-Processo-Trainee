class CreateClans < ActiveRecord::Migration[5.2]
  def change
    create_table :clans do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.date :validade

      t.timestamps
    end
  end
end
