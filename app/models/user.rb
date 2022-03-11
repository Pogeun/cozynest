class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

    def shelter?
        type == 'Shelter'
    end

    def guardian?
        type == 'Guardian'
    end
end
