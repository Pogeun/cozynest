class FosterRequestsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_user, only: [:new, :create, :show, :approve, :show_per_pet]
    before_action :get_foster_request, only: [:show, :approve]
    before_action :get_pet, only: [:new, :create, :end_fostering, :terminate, :show_per_pet]

    def index
    end

    def new
        @foster_request = FosterRequest.new
    end

    def create
        pet = Pet.find(params[:id])
        if pet.guardian && pet.guardian != current_user
            flash[:alert] = "#{@pet.name} is already fostered!"

            redirect_to pet_path(params[:id])

            return
        end
        
        foster_request = FosterRequest.where(pet: pet, guardian: current_user).last
        if foster_request && foster_request.reviewed?
            flash[:alert] = "You have already subbmitted a foster request for #{@pet.name}!"

            redirect_to pet_path(params[:id])

            return
        end

        @foster_request = FosterRequest.new(pet: pet, guardian: current_user, comment: params[:comment])
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
    end

    def approve
        foster_requests = FosterRequest.where(pet: @foster_request.pet, status: :reviewed)

        foster_requests.each_with_index do |foster_request, index|
            if @foster_request == foster_request
                foster_request.approved!

                foster_request.pet.update(guardian: foster_request.guardian)
                foster_request.pet.save
            else
                foster_request.declined!
            end

            if foster_requests[index] == foster_requests.last
                redirect_to pet_path(foster_request.pet.id), notice: "You have successsfully selected guardian for #{@foster_request.pet.name}!"

                return
            end
        end
    end

    def end_fostering
    end

    def terminate
        foster_request = FosterRequest.where(pet: @pet, guardian: current_user).last
        
        @pet.reviews.create(reviewer: current_user, comment: params[:comment])
        
        foster_request.terminated!
        foster_request.pet.guardian = nil

        if foster_request.pet.save
            redirect_to @pet, notice: "Thank you for taking a good care of #{@pet.name}!"

            return
        else
            flash[:alert] = "Something went wrong!"

            redirect_to @pet

            return
        end
    end

    def show_per_pet
        if @pet.shelter.id != current_user.id
            flash[:alert] = "#{@pet.name} does not belong to your shelter!"

            redirect_to pets_path

            return
        end

        @foster_requests = @pet.foster_requests.where(status: :reviewed).all
    end

    private
        def get_foster_request
            @foster_request = FosterRequest.find(params[:id])
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
                flash[:alert] = "Only guardians can access this page!"

                redirect_to foster_requests_path

                return
            else
                
            end
        end

        def authorize_guardian
            action = params[:action]
            if action == "approve" || action == "show_per_pet"
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
