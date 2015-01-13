class DeliveryMailer < ActionMailer::Base
  default from: "stuart.illson@getg5.com"

  def test_email(user)
    mail(to: user.email, subject: 'This worked')
  end
end
