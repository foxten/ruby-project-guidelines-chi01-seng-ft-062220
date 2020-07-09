require_relative '../../config/environment'
require_relative '../dbhelpers/api-accessor'

def get_id(string)
    string.split(/\//).last
end

def build_types
    get_types.map do |type|
        this_type = {
        name: type["name"],
        canon: true
        }
    Type.create(this_type)
    end
end


def build_films
    get_films.map do |film|
        this_film = {
        title: film["title"],
        canon: true
        }
    Film.create(this_film)
    end
end


def build_people
    get_people.map do |person|
        person_attr = {}
        person.map do |p_attr, value|
            if p_attr == "id" || p_attr == "url"
            elsif p_attr == "species"        
                person_attr[:type_id] = get_id(value)
            #gets only the first movie id
            elsif p_attr == "films"
                person_attr[:film_id] = get_id(value[0])
            else
                person_attr[p_attr] = value
            end
        end
        person_attr[:canon] = true
        person_attr[:user_id] = $user.id
        Person.create(person_attr)
    end
end

def populate
    build_types
    build_films
    build_people
end
