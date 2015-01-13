# Preview all emails at http://localhost:3000/rails/mailers/delivery_mailer
class DeliveryMailerPreview < ActionMailer::Preview
  def test_mail_preview
    DeliveryMailer.test_email(User.first)
  end
end
