
require_relative '../../config/environment.rb'
require 'io/console'


$prompt = TTY::Prompt.new


def film_top_menu
    print "\e[2J\e[f"
    response = $prompt.select("So, #{$user.name}, What should we do?",
        "Work with an existing film",
        "Make new film",
        "Exit")
        case
            when response == "Work with an existing film"
                select_film_menu()

            when response == "Make new film"
                make_new_film_menu()

            when response == "Exit"
                print "\e[2J\e[f"
                puts "Goodbye!"
        end
end


def select_film_menu
    print "\e[2J\e[f"
    response = $prompt.select("What film do you want to work on?",
    "Enter a Film Name",
    "See Your Existing Films",
    "Go Back"
    )
    case
        when response == "See Your Existing Films"
            print "\e[2J\e[f"
            show_films
            select_film_menu()

        when response == "Enter a Film Name"
            film_response = $prompt.ask(">")
            if $user.films.find { |film| film.title == film_response }
                film_selection = $user.films.find { |film| film.title == film_response}
                individual_film_menu(film_selection)
            else
                puts "hmm.. can't find that film"
                puts ""
                puts "continue"
                STDIN.getch
                select_film_menu
            end

        when response == "Go Back"
            film_top_menu()
    end
end


def make_new_film_menu
    print "\e[2J\e[f"
    response = $prompt.select("Want to add a new film to your collection?",
    "Create New Film",
    "See Existing Films",
    "Go Back"
    )
    case
        when response == "See Existing Films"
            show_films
            make_new_film_menu()

        when response == "Create New Film"
            new_film = generate_film
            puts "Your new film #{new_film.title} is all set!"
            puts ""
            puts "Continue"
            STDIN.getch
            film_top_menu()

        when response == "Go Back"
            film_top_menu
    end
end


def individual_film_menu(film)
    print "\e[2J\e[f"
    response = $prompt.select("What should we do with #{film.title}",
        "Characters Menu",
        "See Existing Species",        
        "Go Back")
    case
        when response == "Characters Menu"
            film_characters_by_movie_menu(film)

        when response == "See Existing Species"
            show_film_species(film)

        when response == "Go Back"
            select_film_menu()
    end
end


def film_characters_by_movie_menu(film)
    print "\e[2J\e[f"
    response = $prompt.select("#{film.title} Menu",
    "See Characters",
    "Add Character",
    "Remove Character",
    "Go Back"
    )
    case
        when response == "See Characters"
            puts "Current characters in #{film.title}"
            puts ""
            $user.people_by_film(film).map { |char| puts char.name }
            puts ""
            puts "Continue"
            STDIN.getch
            film_characters_by_movie_menu(film)

        when response == "Add Character"
            new_char = generate_person(film)
            puts "Added #{new_char.name} to #{film.title}!"
            puts ""
            puts "Continue"
            STDIN.getch
            individual_film_menu(film)

        when response == "Remove Character"
            delete_character_by_film(film)

        when response == "Go Back"
            individual_film_menu(film)
    end    
end


def list_character_by_film_menu(film)
    print "\e[2J\e[f"
    response = $prompt.select("Show Existing Characters",
    "Edit Character",
    "Go Back"
    )
    case
        when response == "Show Existing Characters",
            characters = $user.people_by_film(film)
            characters.map { |char| puts "#{char.name}" }
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


def delete_character_by_film(film)
    print "\e[2J\e[f"
    puts "Here are your current characters."
    puts ""
    chars = $user.people_by_film(film)
    chars.map { |char| puts char.name }
    puts ""
    response = $prompt.select("Remove someone?",
    "Choose",
    "Cancel"
    )
    case
        when response == "Choose"
            selection = $prompt.ask("Who should we remove?")
            ctd = chars.find { |char| char.name == selection }.id
            if ctd != nil
                print "\e[2J\e[f"
                confirmation = $prompt.select("Permanently remove #{selection} from #{film.title}?",
                "Yes",
                "Cancel"
                )
                case
                    when confirmation == "Yes"
                        puts "Removing #{selection}."
                        Person.destroy(ctd)
                        puts ""
                        puts "Continue"
                        STDIN.getch
                        film_characters_by_movie_menu(film)
                    else
                        delete_character_by_film(film)
                end
            end  
        else
            puts "hmm... can't find that person"
            puts ""
            puts "Continue"
            STDIN.getch
            delete_character_by_film(film)
    end
end


def generate_film
    print "\e[2J\e[f"
    film_name_input = $prompt.ask("What should we call your new film?")
    new_film = Film.create(title: "#{film_name_input}")
    puts "Added #{film_name_input} to your films!"
    puts ""
    puts "Continue"
    STDIN.getch
    new_film_char_input = $prompt.ask("We need a character to star in #{new_film.title}. Let's make one!")
    new_char = generate_person(new_film)
    new_film
end


def generate_person(film)
    print "\e[2J\e[f"
    puts "Tell me about your new character!"
    puts ""
    new_char_attr = $prompt.collect do
        key(:name).ask('Name?', required: true)
        key(:type_id).ask('Species?', required: true)
        key(:age).ask('Age?')
        key(:gender).ask('Gender?')
        key(:eye_color).ask('Eye Color?')
        key(:hair_color).ask('Hair Color?')
        key(:gender).ask('Gender?')
      end
    new_char_attr[:film_id] = film.id
    new_char_attr[:user_id] = $user.id
    new_char_attr[:canon] = false
    if Type.all.find {|type| type.name == new_char_attr[:type_id] }
        new_char_attr[:type_id] = type.id
    else
        new_type = Type.create(name: new_char_attr[:type_id])
        new_char_attr[:type_id] = new_type.id
    end
    new_char = Person.create(new_char_attr)
    new_char
end


def show_films
    print "\e[2J\e[f"
    puts "Here are the films in your collection:"
    puts ""
    $user.films.map { |film| puts "#{film.title}"}
    puts ""
    puts "Continue"
    STDIN.getch
end


def show_film_species(film)
    print "\e[2J\e[f"
    species = $user.types_by_film(film)
    species.map { |type| puts type.name }
    puts ""
    puts "Continue"
    STDIN.getch
    individual_film_menu(film)
end

