class FosterRequestsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_user, only: [:new, :create, :show, :approve, :show_per_pet]
    before_action :get_foster_request, only: [:show, :approve]
    before_action :get_pet, only: [:new, :create, :show_per_pet]

    def index
    end

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
    end

    def approve
        foster_requests = FosterRequest.where(pet: @foster_request.pet)

        foster_requests.each_with_index do |foster_request, index|
            if @foster_request == foster_request
                foster_request.approved!
            else
                foster_request.declined!
            end

            if index == foster_requests.count - 1
                redirect_to show_foster_request_path(params[:id]), notice: "You have successsfully selected guardian for #{@foster_request.pet.name}!"

                return
            end
        end
    end

    def show_per_pet
        if @pet.shelter.id != current_user.id
            flash[:alert] = "#{@pet.name} does not belong to your shelter!"

            redirect_to pets_path

            return
        end

        @foster_requests = @pet.foster_requests.all
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
