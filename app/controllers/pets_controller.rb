class PetsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :get_pet, only: [:show, :edit, :update, :destroy, :new_foster_request, :create_foster_request]
    before_action :authorize_user, only: [:new, :create, :edit, :update, :destroy, :new_foster_request, :create_foster_request]
    before_action :get_categories, only: [:new, :edit]
    before_action :get_foster_requests, only: [:review_foster_requests]

    def index
        @pets = Pet.all
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

    def new_foster_request
        @foster_request = FosterRequest.new
    end

    def create_foster_request
        if FosterRequest.where(pet: @pet, guardian: current_user).first
            flash[:alert] = "You have already subbmitted a foster request for #{@pet.name}!"

            redirect_to @pet

            return
        end

        @foster_request = FosterRequest.new(pet: @pet, guardian: current_user)
        if @foster_request.save
            redirect_to @pet, notice: "You have successsfully submitted a foster request!"

            return
        else
            render "new_foster_request", notice: "Something went wrong!"

            return
        end
    end

    def review_foster_requests
        
    end

    private
        def get_categories
            @categories = PetCategory.all
        end

        def get_pet
            @pet = Pet.find(params[:id])
        end

        def get_foster_requests
            @foster_requests = FosterRequest.find(params[:id])
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
            action = params[:action]
            if action == "new_foster_request" || action == "create_foster_request"
                
            else
                flash[:alert] = "Only shelter representatives can access this page!"

                redirect_to pets_path

                return
            end
        end

        def permit_params
            action = params[:action]
            if action == "new_foster_request" || action == "create_foster_request"
                return params.require(:pet).permit(:comment)
            else
                return params.require(:pet).permit(:name, :category_id, :description, :picture)
            end
        end
end