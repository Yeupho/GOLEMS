class ContactmailMailer < ApplicationMailer
  default from: 'contact@glazedover.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contactmail_mailer.contact.subject
  #
  def contact(user)
    @user = user
    @greeting = "Form Submitted, Thank you for contacting us!"

    mail to: 'vidatechsltns@gmail.com'
    mail to: user.mail
  end
end
