# Preview all emails at http://localhost:3000/rails/mailers/contactmail_mailer
class ContactmailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contactmail_mailer/contact
  def contact
    ContactmailMailer.contact
  end

end
