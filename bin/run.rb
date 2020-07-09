require_relative '../config/environment'

require 'tty/prompt'

$prompt = TTY::Prompt.new 

#(use global variables)

def get_new_username
    puts "What should I call you?"
    print "> "
    $user = gets.chomp
    if User.all.find_by(name: $user) == true
        puts "Oops, someone already has that name."
        get_new_username()
    else
        $user = User.create(name: $user)
    end
    print "\e[2J\e[f"
    puts "Welcome #{$user.name}!"
    sleep(1.5)
    # select_film_menu()
end

def get_people_by_user
    my_characters = Person.all.where(user_id: self.id)
    my_characters.map do |info|
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

def select_film_menu
    #Entry Menu after User selection

    response = $prompt.select("What should we do?",
        "Work on existing film",
        "Make new film",
        "Exit")
        
        case
            when response == "Work on existing film"
                p get_films_by_user

            when response == "Make new film"
                make_film_menu()

            when response == "Exit"
                #end?
        end
end

def film_select
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

def welcome
    print "\e[2J\e[f"
    puts "Welcome to Studio Ghibli Character Builder!"
    sleep(1.5)
    response = $prompt.select("Are you new here?", "Yes", "No")
        case
            when response == "Yes"
                get_new_username

            when response == "No"
                puts "What's your name?"
                $user = gets.chomp

                if User.all.find_by(name: $user)
                    $user = User.all.find_by(name: $user)
                        puts "Hi #{$user.name}!"
                        User.starter_personal_data
                        select_film_menu
                else
                    puts "hmm... can't seem to find you"
                    get_new_username
                end
        end
end

welcome

# puts "new message"