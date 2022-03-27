class Shelter < User
    # Shelter model is inherited from User model
    # they can have many pets
    has_many :pets, foreign_key: 'shelter_id'
end