
class Film < ActiveRecord::Base
    
    has_many :people
    has_many :types, through: :people

end
