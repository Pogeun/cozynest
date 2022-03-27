class Pet < ApplicationRecord
    # pet object belongs to pet category
    belongs_to :category, class_name: 'PetCategory'
    
    # pet object also belongs to shelter and guardian
    # shelter column must exist, but guardian can be left null
    belongs_to :shelter, class_name: 'User'
    belongs_to :guardian, class_name: 'User', optional: true
    
    # pet object can have many foster requests
    # if the pet object is destroyed from the database, all foster requests must be gone as well
    has_many :foster_requests, dependent: :destroy
    
    # pet object can have many reviews
    has_many :reviews, as: :reviewable
    
    # the name and description column of pet object cannot be left blank
    validates :name, presence: true, allow_blank: false
    validates :description, presence: true, allow_blank: false
    
    # each pet object can have related image file which is stored in AWS
    has_one_attached :picture
end