class Pet < ApplicationRecord
    belongs_to :shelter, class_name: 'User'
    belongs_to :guardian, class_name: 'User', optional: true

    belongs_to :category, class_name: 'PetCategory'

    has_one_attached :picture
end
