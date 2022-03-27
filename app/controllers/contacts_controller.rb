class ContactsController < ApplicationController
    def new
        # create new contact model on page load
        @contact = Contact.new
    end

    def create
        # create new contact model with passed contact details like name, email and context
        @contact = Contact.new(params[:contact])
        # save the request details to contact
        @contact.request = request
        if @contact.deliver
            # if the contact details are successfully delivered, print alert message
            flash.now[:success] = "Message sent!"
        else
            # if the contact details are not delivered, print error message
            flash.now[:error] = "Could not send message!"

            # rendet the contact page again
            render :new
        end
    end
end
