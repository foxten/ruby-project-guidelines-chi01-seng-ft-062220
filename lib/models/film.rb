
class Film < ActiveRecord::Base
    has_many :people
    has_many :types, through: :people

   
    def self.find_film_titles(film_id)
        title = ""
        self.get_films.find do |info|
            if info["id"] == film_id
            title = info["title"]
            end
        end
        title
    end

    def list_characters
        search = Person.where(film_id: self.id) 
        search.map{|info| "#{info.name} - #{info.species.name}"}
    end
end