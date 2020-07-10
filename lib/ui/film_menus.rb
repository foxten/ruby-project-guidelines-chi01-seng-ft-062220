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
                select_film_menu()

            when response == "Make new film"
                make_new_film_menu()

            when response == "Exit"
                puts "Goodbye!"
        end
end

### Should not need class methods.
def make_new_film_menu
    print "\e[2J\e[f"
    response = $prompt.ask("What should we call your new film?")
    Film.create(title: "#{response}")
    puts "Added #{response} to your films!"
    film_top_menu()
end


### Need a method that returns an array of all the film objects associated with the user.
def select_film_menu
    print "\e[2J\e[f"
    response = $prompt.select("Enter a film name", "Go back")
    case
        when response == "Enter a film name"
            film_response = $prompt.ask("What film would you like to work with?")
            film_selection = $user.films.find { |film| film.title = film_response }
            individual_film_menu(film_selection)
            
        when response == "Go back"
            film_top_menu()
    end
end


### No methods should be needed.  Needs to know current film.
def individual_film_menu(film)
    print "\e[2J\e[f"
    response = $prompt.select("What should we do with #{film.title}",
        "Characters Menu",
        "See Species",        
        "Go Back")
    case
        when response == "Characters Menu"
            film_characters_by_movie_menu(film)

        when response == "See Species"
            show_film_species(film)

        when response == "Go Back"
            select_film_menu()
    end
end


### Method needs to return an array of all the people objects for a specific film for that user.
### New and Delete should not need methods.
def film_characters_by_movie_menu(film)
    print "\e[2J\e[f"
    response = $prompt.select("#{film.title} menu",
    "Edit Characters",
    "Add Character",
    "Remove Character",
    "Go Back"    
    )
    case
        when response == "Edit Characters"
            list_character_by_film(film)

        when response == "Add Character"

        when response == "Remove Character"

        when response == "Go Back"
    
end

### Need a method to return an array of people objects for the active film, for the active user.
def list_character_by_film_menu(film)
    print "\e[2J\e[f"
    response = $prompt.select("Show Existing Characters",
    "Edit Character",
    "Go Back"
    )
    case
        when response == "Show Existing Characters",
            characters = $user.people_by_film(film)
            characters.map { |char| puts "#{[index] + 1}.  #{char.name}" }
            $prompt.yes?("Done?")
            list_characters_by_film_menu(film)

        when response == "Edit Character"
            char_name = $prompt.ask("What Character Do You Want To Change?")
            char = $user.people_by_film(film).find {|person| person.name == char_name }
            edit_character_menu(char)

        when response == "Go Back"
            film_characters_by_movie_menu(film)
    end
end



### Should not need class methods.
def new_character_by_film(film)
    print "\e[2J\e[f"

    #Prompt for new character info one piece at a time
    #Send back to film_character_menu
end


###Should not need class methods.
def delete_character_by_film(film)
    print "\e[2J\e[f"
    list_of_people = $user.people_by_film(film)
    list_of_people.map { |char| puts char.name }
    response = $prompt.select("Here are your current characters.  Remove someone?",
    "Choose",
    "Cancel"
    )
    case
        when response == "Choose"
            selection = $prompt.ask("Who should we remove?")
            if list_of_people.find { |char| char.name == selection }
                confirmation = $prompt.select("Remove #{selection.name}?",
                "Yes",
                "Cancel"
                )
                case
                    when confirmation == "Yes"
                        puts "Removing #{selection.name}."
                        sleep(1)
                        selection.destroy
                        film_characters_by_movie_menu(film)
                    else
                        delete_character_by_film(film)
                end
            end
            
        else
            puts "hmm... can't find that person"
            delete_character_by_film(film)
    end
end



### Should not need method?  Might be able to inheret specific Person object from previous menu?
def edit_character_menu(person)
    print "\e[2J\e[f"
    person.display_person_info
    response = $prompt.select()

    #List curret user info
    #Prompt user for either Edit or Go Back
    #if Edit, prompt for which stat to edit, then prompt for the new value
    #check the data type.  If allowed, make update, return to edit_character_menu.
        #Else, error, return to edit_character_menu

    #Go Back
end



### Method to return an array of all Types for the given movie, for the given user.
def show_film_species(film)
    print "\e[2J\e[f"
    species = $user.types_by_film(film)
    species.map { |type| puts type.name }
    $prompt.ask("Back")
    individual_film_menu(film)
end

