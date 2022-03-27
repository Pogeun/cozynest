class FosterRequestsController < ApplicationController
    # foster request can only be sent once the user is signed in
    before_action :authenticate_user!
    # check the user's account type
    before_action :authorize_user, only: [:new, :create, :show, :approve, :show_per_pet]
    # retrieve foster request details (FosterRequest model object) when reviewing
    before_action :get_foster_request, only: [:show, :approve]
    # retrieve pet details (Pet model object)
    before_action :get_pet, only: [:new, :create, :end_fostering, :terminate, :show_per_pet]

    def index
    end

    def new
        # create new foster request model on page load
        @foster_request = FosterRequest.new
    end

    def create
        # retrieve pet object based on passed over id
        pet = Pet.find(params[:id])
        # if the pet is already fostered and the current user is not that person
        # (in this case we check whether the pet is already fostered or not by checking if the pet already has a guardian or not
        # as guardian column can be left null when the pet is not fostered)
        if pet.guardian && pet.guardian != current_user
            # alert the message
            flash[:alert] = "#{@pet.name} is already fostered!"

            # return to that pet's page
            redirect_to pet_path(params[:id])

            return
        end
        
        # retrieve foster request object based on the pet object that is retrieved with the id passed and current user object
        # the .last is to retrieve the very last foster request from the database since the .last gives the most recent foster request 
        # as the user might have fostered this pet in the past and might be re-fostering that specific pet I am using .last
        foster_request = FosterRequest.where(pet: pet, guardian: current_user).last
        # if the foster request already exists and is still being reviewed by the shelter
        if foster_request && foster_request.reviewed?
            # alert message
            flash[:alert] = "You have already subbmitted a foster request for #{@pet.name}!"

            # return to the pet's page
            redirect_to pet_path(params[:id])

            return
        end

        # now create the new foster request based on pet and current user objects as well as the comment passed via the form
        @foster_request = FosterRequest.new(pet: pet, guardian: current_user, comment: params[:comment])
        # if the foster request is successfully saved
        if @foster_request.save
            # return to the pet's page with message
            redirect_to pet_path(params[:id]), notice: "You have successsfully submitted a foster request!"

            return
        else
            # if fails, alert the message
            flash[:alert] = "Something went wrong!"

            # then return to the pet's page
            redirect_to pet_path(params[:id])

            return
        end
    end

    def show
    end

    def approve
        # retrieve the all foster requests where the pet is the pet of the foster request that is currently being reviewed
        # and status is where the requests those are waiting to be reviewed by the shelter representative
        foster_requests = FosterRequest.where(pet: @foster_request.pet, status: :reviewed)

        # loop through every single foster requests retrieved above
        foster_requests.each_with_index do |foster_request, index|
            # if the request is equal to what the shelter representative is currently reviewing
            if @foster_request == foster_request
                # approve the guardian's request
                foster_request.approved!

                # update the related pet's guardian column then save
                foster_request.pet.update(guardian: foster_request.guardian)
                foster_request.pet.save
            else
                # for all other foster requests set the status to declined
                foster_request.declined!
            end

            # when reach to the very last request
            if foster_requests[index] == foster_requests.last
                # alert the message and return to the pet's page
                redirect_to pet_path(foster_request.pet.id), notice: "You have successsfully selected guardian for #{@foster_request.pet.name}!"

                return
            end
        end
    end

    def end_fostering
    end

    def terminate
        # retrieve foster request object based on the pet object that is retrieved with the id passed and current user object
        # the .last is to retrieve the very last foster request from the database since the .last gives the most recent foster request 
        # as the user might have fostered this pet in the past and might be re-fostering that specific pet I am using .last
        foster_request = FosterRequest.where(pet: @pet, guardian: current_user).last
        
        # create a review data based on the comment
        # obviously the reviewer is the current user, the guardian
        @pet.reviews.create(reviewer: current_user, comment: params[:comment])
        
        # set the status of foster request to terminated
        foster_request.terminated!
        # empty out the pet's guardian
        foster_request.pet.guardian = nil
        # if the data is successfully saved
        if foster_request.pet.save
            # alert the message and return to the pet's page
            redirect_to @pet, notice: "Thank you for taking a good care of #{@pet.name}!"

            return
        else
            # otherwise alert and return to the pet's page
            flash[:alert] = "Something went wrong!"

            redirect_to @pet

            return
        end
    end

    def show_per_pet
        # the authentication process to prevent a random person from accessing foster requests
        # only the pet's shelter representatives can review foster requests
        if @pet.shelter.id != current_user.id
            flash[:alert] = "#{@pet.name} does not belong to your shelter!"

            redirect_to pets_path

            return
        end

        # retrieve all foster requests for the specific pet where the requests needs to be reviewed
        @foster_requests = @pet.foster_requests.where(status: :reviewed).all
    end

    private
        def get_foster_request
            # retrieve foster request based on passed id value
            @foster_request = FosterRequest.find(params[:id])
        end

        def get_pet
            # retrieve pet based on passed id value
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
            # do not allow shelter representatives create foster request
            action = params[:action]
            if action == "new" || action == "create"
                flash[:alert] = "Only guardians can access this page!"

                redirect_to foster_requests_path

                return
            end
        end

        def authorize_guardian
            # do not allow guardians to review foster requests nor permit them to approve the request
            action = params[:action]
            if action == "approve" || action == "show_per_pet"
                flash[:alert] = "Only shelter representatives can access this page!"

                redirect_to foster_requests_path

                return
            else
                
            end
        end

        # security process to only permit comment data
        def permit_params
            return params.require(:pet).permit(:comment)
        end
end
