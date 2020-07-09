
class User < ActiveRecord::Base

    has_many :people
    has_many :films, through: :people


    def find_user_people
        Person.all.select do |person|
            person.user_id == self.id
        end
    end

    def find_user_films
        films = []
        find_user_people.map do |person|
            films << person.find_person_films
        end
        films.uniq
    end

end
