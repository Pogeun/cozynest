class PagesController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def index
    end

    def donation
        @donation_sessions = {}
        [500, 1000, 1500, 2000].each do |value|
            donation_session = Stripe::Checkout::Session.create(
                payment_method_types: ['card'],
                line_items: [
                    {
                        name: "Donate to Cozynest",
                        description: "Donation description",
                        amount: value,
                        currency: 'aud',
                        quantity: 1
                    }
                ],
                success_url: generate_url_for_path(donation_path),
                cancel_url: generate_url_for_path(donation_path)
            )
    
            @donation_sessions[value] = donation_session
        end
    end

    def webhook
        render plain: "Donation Success!"
    end

    private
        def generate_url_for_path(path)
            return root_url + path[1..-1]
        end
end
