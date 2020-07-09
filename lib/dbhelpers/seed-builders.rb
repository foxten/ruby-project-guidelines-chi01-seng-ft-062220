require_relative '../../config/environment'
require_relative '../dbhelpers/api-accessor'

def get_id(string)
    string.split(/\//).last
end

def build_types
    types = get_types
    types.map do |type|
        this_type = {
        type_id: type["id"],
        name: type["name"]
        }
    this_type[:canon] = true
    Type.create(this_type)
    end
end


def build_films
    films = get_films
    films.map do |film|
        this_film = {
        film_id: film["id"],
        title: film["title"]
        }
    this_film[:canon] = true
    Film.create(this_film)
    end
end


def build_people
    people = get_people
    people.map do |person|
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
        Person.create(person_attr)
    end
end


def populate
    build_films
    build_types
    build_people
end
