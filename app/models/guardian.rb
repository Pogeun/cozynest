class Guardian < User
    has_many :pets, foreign_key: 'guardian_id'
end