class FosterRequest < ApplicationRecord
    # foster request belongs to the user and also to the pet
    belongs_to :guardian, class_name: 'User'
    belongs_to :pet

    # enum to easily manage the request status in database
    enum status: [:reviewed, :declined, :approved, :terminated]
end