class Shelter < User
    has_many :pets, foreign_key: 'shelter_id'
end