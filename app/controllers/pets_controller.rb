class PetsController < ApplicationController
    # allow guests to view the all pets registered and each pet's details
    before_action :authenticate_user!, except: [:index, :show]
    # retrieve pet details for CRUD
    before_action :get_pet, only: [:show, :edit, :update, :destroy]
    # authorize user for CRUD
    before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy]
    # retrieve all categories on create and update
    before_action :get_categories, only: [:new, :edit]

    def index
        # retrieve all pet data from the database
        @pets = Pet.all
    end

    def show
    end

    def new
        # create new pet model on page load
        @pet = Pet.new
    end

    def create
        # create new pet object, but also append shelter details
        @pet = Pet.new(permit_params.merge(:shelter => current_user))
        # when successfully saved
        if @pet.save
            # return to pet's page and alert
            redirect_to @pet, notice: "Pet has been successfully added!"
        else
            # retrieve pet categories again
            get_categories
            
            # render the page again so the user could restart from the scratch
            render "new", notice: "Something went wrong!"

            return
        end
    end

    def edit
    end

    def update
        # update pet details and again, append shelter details
        # this might be redundant, but is done for extra safety
        @pet.update(permit_params.merge(:shelter => current_user))
        # when successfully saved
        if @pet.save
            # return to the pet's page and alert
            redirect_to @pet, notice: "Pet has been successfully added!"
        else
            # otherwise retrieve pet categories again
            get_categories
            
            # render the page again
            render "edit", notice: "Something went wrong!"

            return
        end
    end

    def destroy
        # delete pet object from the database
        @pet.destroy

        # return to the pets page and alert
        redirect_to pets_path, notice: "Successfully deleted!"

        return
    end

    def show_user_pets
    end

    private
        def get_categories
            # retrieve all categories objects
            @categories = PetCategory.all
        end

        def get_pet
            # retrieve pet with the passed over id value
            @pet = Pet.find(params[:id])
        end

        def authorize_user
            # check whether the current user type is shelter or guardian
            if current_user.shelter?
                authorize_shelter
            else
                authorize_guardian
            end
        end

        def authorize_shelter
            # only allow shelter representatives to CRUD the pet
            # however, do not allow the current user to UD the pet data, if the current user is not the pet's shelter manager
            action = params[:action]
            if action == "new" || action == "create"
                return
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
            # obviously we don't want guardians to CRUD pet object
            flash[:alert] = "Only shelter representatives can access this page!"

            redirect_to pets_path

            return
        end

        # security process to only permit name, category, description and picture of the pet
        def permit_params
            return params.require(:pet).permit(:name, :category_id, :description, :picture)
        end
end