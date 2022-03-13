class Pet < ApplicationRecord
    belongs_to :category, class_name: 'PetCategory'
    
    belongs_to :shelter, class_name: 'User'
    belongs_to :guardian, class_name: 'User', optional: true
    
    has_many :foster_requests, dependent: :destroy
    
    has_many :reviews, as: :reviewable
    
    validates :name, presence: true, allow_blank: false
    validates :description, presence: true, allow_blank: false
    
    has_one_attached :picture
end