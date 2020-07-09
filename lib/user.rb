class User < ActiveRecord::Base
    has_many :people
    has_many :films, through: :people

    def self.finder
        my_world_info = Person.all.where(user_id: $user.id)
    end

    def get_people_by_user
        finder.map do |info|
            info.name
        end
    end 

    def get_films_by_user
        film_titles = []
        User.finder.each do |info|
           film_titles << Film.find_by(id: info.film_id).title
        end
        film_titles.uniq
    end

    def get_types_by_user
        type_names = []
        finder.each do |info|
            type_names << Type.find_by(id: info.type_id).name
        end
        type_names.uniq
    end

# Person.all.update(user_id: 1)
    def self.starter_personal_data
        my_characters = []
        Person.all.each do |info|
            my_characters << info.dup.update(user_id: $user.id)
        end
        my_characters
    end


end
