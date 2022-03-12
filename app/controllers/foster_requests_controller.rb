class FosterRequestsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_user, only: [:new, :create, :show, :review]
    before_action :get_pet, only: [:new, :create]
    before_action :get_foster_requests, only: [:review]

    def new
        @foster_request = FosterRequest.new
    end

    def create
        if FosterRequest.where(pet: Pet.find(params[:id]), guardian: current_user).first
            flash[:alert] = "You have already subbmitted a foster request for #{@pet.name}!"

            redirect_to pet_path(params[:id])

            return
        end

        @foster_request = FosterRequest.new(pet: Pet.find(params[:id]), guardian: current_user, comment: params[:comment])
        if @foster_request.save
            redirect_to pet_path(params[:id]), notice: "You have successsfully submitted a foster request!"

            return
        else
            flash[:alert] = "Something went wrong!"

            render "new_foster_request"

            return
        end
    end

    def show
        @foster_request = FosterRequest.find(params[:id])
        if @foster_request.guardian_id != current_user.id && @foster_request.pet.shelter_id != current_user.id
            flash[:alert] = "You do not have a permission to see this foster request!"
            
            redirect_to pets_path

            return
        end
    end

    def review
        
    end

    private
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
                flash[:alert] = "Only guardians can access this page!"

                redirect_to foster_requests_path

                return
            else
                
            end
        end

        def authorize_guardian
            action = params[:action]
            if action == "review"
                flash[:alert] = "Only shelter representatives can access this page!"

                redirect_to foster_requests_path

                return
            else
                
            end

            
        end

        def permit_params
            return params.require(:pet).permit(:comment)
        end
end
