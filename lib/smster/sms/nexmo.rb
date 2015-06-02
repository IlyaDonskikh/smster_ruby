class Sms::Nexmo < Sms
  private

    def modify_params
      self.to = to.gsub(/\D/, '').to_s
      self.text = text.tr(' ', '+')
    end

    def send_request
      config = Smster.configuration

      RestClient.post(
        'https://rest.nexmo.com/sms/json',
        text: text,
        to: to,
        content_type: :json,
        from: name,
        api_key: config.nexmo_key,
        api_secret: config.nexmo_sekret
      )
    end

    def generate_send_resonse(response)
      json_response = JSON.parse(response)
      error_text = json_response['messages'][0]['error-text']

      return if error_text

      json_response['messages'][0]['message-id']
    end
end
