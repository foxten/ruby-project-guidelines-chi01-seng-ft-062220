class People < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |c|
      c.string :name
      c.integer :type_id
      c.integer :film_id
      c.integer :user_id
      c.string :age
      c.string :gender
      c.string :eye_color
      c.string :hair_color
      c.boolean :canon
    end
  end
end
