class Contact < MailForm::Base
    # basically contact details are not stored in database internally

    # validation process of contact form
    # name and message must exist
    # emails should be formatted correctly
    # nickname is only for the page to trick the Bot
    attribute :name, validate: true
    attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
    attribute :message, validate: true
    attribute :nickname, captcha: true

    # Declare the e-mail headers. It accepts anything the mail method
    # in ActionMailer accepts.
    def headers
        {
        :subject => "Contact Form Inquiry",
        :to => "cozynest.official@gmail.com",
        :from => %("#{name}" <#{email}>)
        }
    end
end