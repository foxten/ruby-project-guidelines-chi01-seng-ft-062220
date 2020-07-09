class ChangeFilmIdDataType < ActiveRecord::Migration[5.2]
  #for people table
  def change
    change_column :people, :film_id, :string
  end
end
