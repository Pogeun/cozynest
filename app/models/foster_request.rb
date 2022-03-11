class FosterRequest < ApplicationRecord
    belongs_to :guardian, class_name: 'User'
    belongs_to :pet
end
