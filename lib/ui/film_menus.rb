require_relative '../../config/environment.rb'

$prompt = TTY::Prompt.new

### No Class Methods needed
def film_top_menu
    print "\e[2J\e[f"
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
                puts "Goodbye!"
        end
end

### Should not need class methods.
def make_new_film_menu
    print "\e[2J\e[f"
    #Gets's a name from user and makes a new film
end

### Need a method that returns an array of all the film objects associated with the user.
def select_film_from_list_menu
    print "\e[2J\e[f"
    #Shows a list of existing films for selection
    film_names = $user.films.map { |film| film.title }
    response = $prompt.select("Choose a film!", %w (film_names), "Back")

        case
            when response == "#{response}"
                individual_film_menu()#TODO WHICH FILM

            when response == "Back"
                film_top_menu()
        end
end

### No methods should be needed.  Needs to know current film.
def individual_film_menu
    print "\e[2J\e[f"
    #Shows options to interact with a specific film for the user
    response = $prompt.select("What should we do with #{film.title}",
        "Characters Menu",
        "See Species",        
        "Go Back")
    case
        when response == "Characters Menu"
            film_characters_by_movie_menu()

        when response == "See Species"
            show_film_species()

        when response == "Go Back"
            select_film_menu()
    end
end

### Method needs to return an array of all the people objects for a specific film for that user.
### New and Delete should not need methods.
def film_characters_by_movie_menu
    print "\e[2J\e[f"
    #Gives the option to list characters, create a new character, or delete a character for the film
    #List Characters
    #Else New Character
    #Else Delete Character
    #Else Back
    
end

### Need a method to return an array of people objects for the active film, for the active user.
def list_character_by_film_menu
    print "\e[2J\e[f"
    #Show a list of characters for the active film.
    #Select a character to see or edit stats
    #Back
end

### Should not need class methods.
def new_character_by_film
    print "\e[2J\e[f"
    #Prompt for new character info one piece at a time
    #Send back to film_character_menu
end

###Should not need class methods.
def delete_character_by_film
    print "\e[2J\e[f"
    #Show a list of characters for the given film
    #delete the selection
end

### Should not need method?  Might be able to inheret specific Person object from previous menu?
def edit_character_menu
    print "\e[2J\e[f"
    #List curret user info
    #Prompt user for either Edit or Go Back
    #if Edit, prompt for which stat to edit, then prompt for the new value
    #check the data type.  If allowed, make update, return to edit_character_menu.
        #Else, error, return to edit_character_menu

    #Go Back
end

### Method to return an array of all Types for the given movie, for the given user.
def see_species
    print "\e[2J\e[f"
    #Display types for current film
    #Back
end

