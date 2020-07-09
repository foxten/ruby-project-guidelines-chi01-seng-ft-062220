
class Person < ActiveRecord::Base

    belongs_to :types
    belongs_to :films
    belongs_to :users
    
end
