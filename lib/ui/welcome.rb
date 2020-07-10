require_relative '../../config/environment.rb'
require 'io/console'

$prompt = TTY::Prompt.new

def new_user(user_name)
    $user = User.create(name: user_name)
    populate
    $user
end


def get_new_username
    print "\e[2J\e[f"
    response = $prompt.ask("What's your name?")
    
    if  User.all.find { |user| user.name == name_response }
        puts "Oops, someone already has that name."
        get_new_username()
    else
        new_user(user_name)
        print "\e[2J\e[f"
        puts "Welcome, #{$user.name}!"
        puts "Continue"
        STDIN.getch
        select_film_menu()
    end
end


def welcome
    print "\e[2J\e[f"
    puts "Welcome to Studio Ghibli Character Builder!"
    response = $prompt.select("Are you new here?", "Yes", "No")

        case
            when response == "Yes"
                get_new_username()

            when response == "No"
                print "\e[2J\e[f"
                puts "What's your name?"
                name_response = gets.chomp
                if  User.all.find { |user| user.name == name_response }
                    $user = User.all.find { |user| user.name == name_response }
                    puts "Welcome back, #{$user.name}!"
                    puts "Continue"
                    film_top_menu()
                else
                    puts "hmm... can't seem to find you"
                    puts "Continue"
                    STDIN.getch
                    welcome()
                end
        end
end

