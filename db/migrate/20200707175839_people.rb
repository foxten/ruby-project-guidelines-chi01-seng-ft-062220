class People < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |c|
      c.string :name
      c.string :type_id
      c.string :film_id
      c.string :age
      c.string :gender
      c.string :eye_color
      c.string :hair_color
      c.string :user_id
      c.boolean :canon
    end
  end
end
