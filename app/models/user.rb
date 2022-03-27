class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

    # valdiate username
    # it must be unique and must contain alphabets and numbers only
    validates :username, uniqueness: { case_sensitive: false }, presence: true, allow_blank: false, format: { with: /\A[a-zA-Z0-9]+\z/ }

    # user has many reviews
    has_many :reviews, as: :reviewable

    def shelter?
        type == 'Shelter'
    end

    def guardian?
        type == 'Guardian'
    end
end