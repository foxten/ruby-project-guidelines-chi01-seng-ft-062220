class AddAttrsToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :gender, :string
    add_column :people, :age, :string
    add_column :people, :eye_color, :string
    add_column :people, :hair_color, :string
  end
end
