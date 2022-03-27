class Guardian < User
    # Guardian model is inherited from User model
    # they can have many pets
    has_many :pets, foreign_key: 'guardian_id'
end