
class Type < ActiveRecord::Base

    has_many :people
    has_many :films, through: :people

    def self.find_species_names(species_id)
        name = ""
        self.get_species.find do |info|
            if info["id"] == species_id
            name = info["name"]
            end
        end
        name
    end

end