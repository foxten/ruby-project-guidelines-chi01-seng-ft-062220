class AddFilmIdToFilms < ActiveRecord::Migration[5.2]
  def change
    add_column :films, :film_id, :string
  end
end
