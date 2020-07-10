
class Person < ActiveRecord::Base

    belongs_to :types
    belongs_to :films
    belongs_to :users
   
    def display_person_info
        puts "Name: #{self.name}"
        species = Type.all.find { |type| type.id == self.type_id }
        puts "Species: #{species.name}"
        film = Film.all.find { |film| film.id == self.film_id }
        puts "Seen in #{film.title}."
        puts "Age: #{self.age}"
        puts "Gender: #{self.gender}"
        puts "Eye Color: #{self.eye_color}"
        puts "Hair Color: #{self.hair_color}"
        if self.canon == true
            puts "Canon Character"
        else
            puts "Non-Canon Character"
        end
    end

    
end
