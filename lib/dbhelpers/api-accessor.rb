
def get_films
    films = RestClient.get('https://ghibliapi.herokuapp.com/films')
    films = JSON.parse(films)
    films
end

def get_people
    people = RestClient.get('https://ghibliapi.herokuapp.com/people')
    people = JSON.parse(people)
    people
end  

def get_types
    types = RestClient.get('https://ghibliapi.herokuapp.com/species')
    types = JSON.parse(types)
    types
end

