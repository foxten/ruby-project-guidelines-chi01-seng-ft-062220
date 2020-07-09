$prompt = TTY::Prompt.new


def get_new_username
    puts "What should I call you?"
    print "> "
    name = gets.chomp
    $user = User.create(name: name)
    puts "Welcome!"
end


def get_people_by_user
end


def get_types_by_films_of_user
end


def get_people_by_user_film
end


def welcome
    response = $prompt.select("Are you new here?", "Yes", "No")

        case

            when response == "Yes"
                puts "And who are you?"
                print "> "
                name = gets.chomp
                $user = User.create(name: name)
                puts "Welcome!"

            when response == "No"
                if User.all.find { |user| response == user.name }
                    puts "Oops, someone already has that name."
                else
                    puts "What's your name?"
                    print "> "
                    id = gets.chomp
                    
                    if User.all.find{ |user| user.id == id.to_i }

                puts "Welcome back #{$user.name}"
            end
end


def select_film_menu
    response = $prompt.select("What should we do?", "Work on existing film", "Make new film", "Go back")
        case
            when response == "Work on existing film"
                film_menu()

            when response == "Make new film"
                make_film_menu()

            when response == "Go back"
                main_menu()
            end
        end
    end
end


def film_menu(film)
#   ADD FILM DESCRIPTION?
#   puts "#{film.description}"
    response = $prompt.select("What should we do with #{film.name}",
        "See Characters",
        "See Species",        
        "Go Back"
        )
    case
        when response == "See Characters"
            film_character_menu()

        when response == "See Species"
            show_film_species()

        when response == "Go Back"
            select_film_menu()
    end
end


def film_character_menu
    
end


def see_species
    types = []
    $user.people.map do |person|
        if person.film_id == $film.film_id
            types << person.type
        end
    end
    types
end


