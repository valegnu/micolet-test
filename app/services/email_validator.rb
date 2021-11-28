require 'net/http'
require 'net/https'

# FIXME: API_KEY is here only for demostration purposes, is an incorrect practice

class EmailValidator
  API_KEY = '74501a5dc4354498b9d8f7c11e5a3c26'

  def initialize(email)
    @email = email
  end

  def perform
    http_options
    response = http.request(request)
 
    return 500 unless response.code.to_i == 200

    response.body
  rescue StandardError => e
    500
  end

  private

  def uri
    @uri ||= URI("https://emailvalidation.abstractapi.com/v1/?api_key=#{API_KEY}&email=#{@email}")
  end

  def http
    @http ||= Net::HTTP.new(uri.host, uri.port)
  end

  def http_options
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  end

  def request
    @request ||= Net::HTTP::Get.new(uri)
  end
end
