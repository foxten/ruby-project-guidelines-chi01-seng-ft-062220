
class Person < ActiveRecord::Base

    belongs_to :type
    belongs_to :film
    
end

