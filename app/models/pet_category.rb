class PetCategory < ApplicationRecord
    # each pet categories can have many pet objects
    has_many :pets
end
