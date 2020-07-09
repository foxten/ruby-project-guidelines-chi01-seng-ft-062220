
class User < ActiveRecord::Base

    has_many :people

    # def films
    #     self.people.map { |person| person.film }.uniq
    # end

    # def types_by_film
    #     films = []
    #     find_user_people.map do |person|
    #         films << person.find_person_films
    #     end
    #     films.uniq
    # end

end

