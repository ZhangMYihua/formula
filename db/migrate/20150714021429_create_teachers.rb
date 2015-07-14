class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.decimal :price
      t.string :skype
      t.string :qq
      t.string :country
      t.string :subject

      t.timestamps null: false
    end
  end
end
