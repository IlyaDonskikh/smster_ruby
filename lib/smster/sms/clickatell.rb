class Sms::Clickatell < Sms
  private

    def modify_params
      self.to = to.gsub(/\D/, '').to_s
      self.text = text.tr(' ', '+')
    end

    def send_request
      code = Smster.configuration.clickatell_authorization_code
      msg_params = { 'text' => text, 'to' => [to] }.to_json

      RestClient.post(
        'https://api.clickatell.com/rest/message',
        msg_params,
        content_type: :json,
        accept: :json,
        'X-Version' => 1,
        'Authorization' => "bearer #{code}"
      )
    end

    def generate_send_resonse(response)
      response = JSON.parse(response)
      response['data']['message'][0]['apiMessageId']
    end
end
