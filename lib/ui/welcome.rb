require_relative '../../config/environment.rb'

$prompt = TTY::Prompt.new

def new_user(user_name)
    $user = User.create(name: user_name)
    populate
    $user
end


def get_new_username
    puts "What should I call you?"
    print "> "
    user_name = gets.chomp
    if    User.all.find { |user| user.name == name_response }
                        puts "Oops, someone already has that name."
                        get_new_username()
    else
        new_user(user_name)
        print "\e[2J\e[f"
        puts "Welcome!"
        select_film_menu()
    end
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
                name_response = gets.chomp
                if  User.all.find { |user| user.name == name_response }
                    $user = User.all.find { |user| user.name == name_response }
                    puts "Welcome back!"
                    film_top_menu()
                else
                    puts "hmm... can't seem to find you"
                    welcome()
                end
        end
end

