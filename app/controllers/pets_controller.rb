class PetsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :get_pets, only: [:index, :show_user_pets]
    before_action :get_pet, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy]
    before_action :get_categories, only: [:new, :edit]

    def index
    end

    def show
    end

    def new
        @pet = Pet.new
    end

    def create
        @pet = Pet.new(permit_params.merge(:shelter => current_user))
        if @pet.save
            redirect_to @pet, notice: "Pet has been successfully added!"
        else
            get_categories
            
            render "new", notice: "Something went wrong!"

            return
        end
    end

    def edit
    end

    def update
        @pet.update(permit_params.merge(:shelter => current_user))
        if @pet.save
            redirect_to @pet, notice: "Pet has been successfully added!"
        else
            get_categories
            
            render "new", notice: "Something went wrong!"

            return
        end
    end

    def destroy
        @pet.destroy

        redirect_to pets_path, notice: "Successfully deleted!"

        return
    end

    def show_user_pets
    end

    private
        def get_categories
            @categories = PetCategory.all
        end

        def get_pets
            @pets = params[:action] == "index" ? Pet.all : current_user.pets
        end

        def get_pet
            @pet = Pet.find(params[:id])
        end

        def authorize_user
            if current_user.shelter?
                authorize_shelter
            else
                authorize_guardian
            end
        end

        def authorize_shelter
            action = params[:action]
            if action == "new" || action == "create"

            elsif action == "edit" || action == "update" || action == "destroy"
                if @pet.shelter.id != current_user.id
                    flash[:alert] = "#{@pet.name} does not belong to your shelter!"

                    redirect_to pets_path

                    return
                end
            else
                flash[:alert] = "Only guardians can access this page!"

                redirect_to pets_path

                return
            end
        end

        def authorize_guardian
            flash[:alert] = "Only shelter representatives can access this page!"

            redirect_to pets_path

            return
        end

        def permit_params
            return params.require(:pet).permit(:name, :category_id, :description, :picture)
        end
end