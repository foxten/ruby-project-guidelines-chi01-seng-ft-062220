
class User < ActiveRecord::Base

    has_many :people

    def films
        films = []
        self.people.map do |person|
            Film.all.map do |film|
                if film.id == person.film_id
                    films << film
                end
            end
        end
        films
    end

    def people_by_film(film)
        self.people.select do |person|
            person.film_id == film.id
        end
    end

    def types_by_film(film)
        types = []
        self.people.map do |person|
            if person.film_id = film.id
                types << Type.all.find { |type| type.id == person.type_id }    
            end
        end
        types.uniq
    end

end

