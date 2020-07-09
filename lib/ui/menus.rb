
$prompt = TTY::Prompt.new

def get_new_username
    puts "What should I call you?"
    print "> "
    name = gets.chomp
    $user = User.create(name: name)
    ## TODO Populate all canon=true people
    print "\e[2J\e[f"
    puts "Welcome!"
    sleep(1.5)
    select_film_menu()
end


def welcome
    print "\e[2J\e[f"
    puts "Welcome to Studio Ghibli Character Builder!"
    sleep(1.5)
    response = $prompt.select("Are you new here?", "Yes", "No")

        case
            when response == "Yes"
                get_new_username()

            when response == "No"
                puts "What's your name?"
                response = gets.chomp

                if    User.all.find { |user| user.name == response }
                        puts "Oops, someone already has that name."
                        get_new_username()
                elsif User.all.find { |user| user.name == response }
                        $user = user
                        puts "Hi #{$user.name}!"
                        film_top_menu()
                else
                    puts "hmm... can't seem to find you"
                    get_new_username()
                end
        end
end


def film_top_menu
    #Entry Menu after User selection
    response = $prompt.select("What should we do?",
        "Choose existing film",
        "Make new film",
        "Exit")
        case
            when response == "Work on existing film"
                film_select_menu()

            when response == "Make new film"
                make_film_menu()

            when response == "Exit"
                #end?
        end
end



def film_select_menu
    people = #get_user_people
    films = people.map do |person|
            person.films
    films = films.uniq

    response = $prompt.select("Here are your current films:",
    %w( films )
    )
end


def film_menu(film)
    #Explores a selected film associated with the user
    response = $prompt.select("What should we do with #{film.name}",
        "See Characters",
        "See Species",        
        "Go Back")
    case
        when response == "See Characters"
            film_character_menu()

        when response == "See Species"
            show_film_species()

        when response == "Go Back"
            select_film_menu()
    end
end


def get_people_by_user
    #should return an array of people belonging to current user


end


def get_types_by_films_of_user
    #should return a list of films associated with people belonging to current user


end


def get_people_by_user_film
    #select people associated with current user, and then with current film

end







def film_character_menu
   #Selects for active user people, then by film
   #Display character list
   #Options:
end


def see_species
    #Select people for active user, then film, then return unique types.
    types = []
    $user.people.map do |person|
        if person.film_id == $film.film_id
            types << person.type
        end
    end
    types
end

