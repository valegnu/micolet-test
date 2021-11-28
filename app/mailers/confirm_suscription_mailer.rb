class ConfirmSuscriptionMailer < ApplicationMailer
  default from: "contact@micolet.com"

  def confirm
    @email = params[:email]
    @welcome = t(".welcome")
    @body = t(".body")
    @call_to_action = t(".call_to_action")
 
    mail(to: @email, subject: t(".subject"))
  end
end
