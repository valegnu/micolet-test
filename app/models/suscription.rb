class Suscription < ApplicationRecord  
  validates :email, :preferences, presence: true

  validate :correct_format_email?, if: :email_present?
  validate :preferences_valid?, if: :preferences_present?
  validate :email_exists?, if: :valid_format_of_email? and validates_uniqueness_of :email

  private

  def email_present?
    email.present?
  end

  def preferences_present?
    preferences.present?
  end

  # Remote email validator (abstract api)
  # NOTE: Validation with abstract api runs only if correct_format_email? is true
  # If something is bad with request, skip this validation, else run bad_score_email? to ckeck score
  # If score is ok the request does not run again unless email changes, else try send new request until score is ok

  def email_exists?
    reset_email_validator if current_email_is_not_equal_with_previus_validator?

    return true if email_validator == 500 # Skip remote validation if something goes wrong with request

    email_does_not_exist if bad_score_email?
  
    true
  end

  def email_does_not_exist
    unset_email_validator
    errors.add(:email, :wrong_email)
  end

  def bad_score_email?
    (JSON.parse email_validator)['quality_score'].to_f < 0.7
  end
  
  def email_validator
    @email_validator ||= EmailValidator.new(email).perform
  end

  def unset_email_validator
    @email_validator = nil
  end

  def reset_email_validator
    unset_email_validator
    email_validator
  end

  def current_email_is_not_equal_with_previus_validator?
    @email_validator.present? && @email_validator != 500 &&
      (JSON.parse @email_validator)['email'] != email
  end

  # Local email validators
  def valid_format_of_email?
    (email =~ URI::MailTo::EMAIL_REGEXP) == 0
  end

  def correct_format_email?
    errors.add(:email, :invalid_format) unless valid_format_of_email?

    true
  end

  # Preferences validators
  def preferences_valid?
    errors.add(:preferences, :invalid_format) if preferences_invalid?

    true
  end

  def preferences_invalid?
    !preferences.is_a?(Hash) || preferences.size == 0
  end
end
