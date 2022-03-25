class Review < ApplicationRecord
    # review object belongs to reviewer
    belongs_to :reviewer, class_name: 'User'

    # review object belongs to reviewable as polymorphic data
    belongs_to :reviewable, polymorphic: true
end