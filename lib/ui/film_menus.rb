require_relative '../../config/environment.rb'

$prompt = TTY::Prompt.new


def film_top_menu
    #Entry Menu after User selection
    response = $prompt.select("What should we do?",
        "Choose existing film",
        "Make new film",
        "Exit")
        case
            when response == "Choose existing film"
                film_select_menu()

            when response == "Make new film"
                make_film_menu()

            when response == "Exit"
                #end?
        end
end


def film_select_menu
    #Present a list of films for selection
    #else, Back

    # ## TODO
    # response = $prompt.select("Here are your current films:",
    # %w( films )
    # )
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
    #List characters
    #Else New Character
    #Else Delete Character
    #Else Back
end


def see_species(current_film)
    #Display types for current film
    #Back
end

def make_film_menu
    ##Maybe
end

