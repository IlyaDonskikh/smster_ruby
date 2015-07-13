class Sms::Nexmo < SmsLayer
  attr_accessor :nexmo_key, :nexmo_sekret

  def nexmo_key
    @nexmo_key ||= config.nexmo_key
  end

  def nexmo_sekret
    @nexmo_sekret ||= config.nexmo_sekret
  end

  private

    def modify_params
      self.to = to.gsub(/\D/, '').to_s
      self.text = text.tr(' ', '+')
    end

    def send_request
      RestClient.post(
        'https://rest.nexmo.com/sms/json',
        text: text,
        to: to,
        content_type: :json,
        from: name,
        api_key: nexmo_key,
        api_secret: nexmo_sekret
      )
    end

    def assign_attrs_by(response)
      json_response = JSON.parse(response)

      self.status_message = json_response['messages'][0]['error-text']
      self.api_message_id = json_response['messages'][0]['message-id']
    end
end
