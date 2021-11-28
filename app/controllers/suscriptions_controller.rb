class SuscriptionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  layout 'landing'

  def new
    @options = %w[women men children]
  end

  def create
    suscription = Suscription.new(suscription_params)
    
    if suscription.save
      send_notification suscription.email
      render json: { message: "success" }, status: :ok
    else
      render json: { message: "error", errors: suscription.errors.full_messages },
             status: :ok
    end

  rescue StandardError => e
    render json: { message: e.message }, status: :unprocessable_entity
  end

  private
  
  def suscription_params
    params.require(:suscription).permit(:email, preferences: {})
  end

  def send_notification email_to
    ConfirmSuscriptionMailer.with(email: email_to).confirm.deliver_later
  end
end
