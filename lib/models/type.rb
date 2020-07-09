
class Type < ActiveRecord::Base

    has_many :people
    has_many :films, through: :people


end
