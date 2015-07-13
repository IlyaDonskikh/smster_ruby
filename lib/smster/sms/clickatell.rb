class Sms::Clickatell < SmsLayer
  attr_accessor :unicode, :clickatell_key

  def clickatell_key
    @clickatell_key ||= config.clickatell_authorization_code
  end

  private

    def modify_params
      self.to = to.gsub(/\D/, '').to_s
      self.text = text.tr(' ', '+')
    end

    def send_request
      msg_params = {
        'text' => text,
        'to' => [to],
        'unicode' => unicode,
        'from' => name
      }.to_json

      start_request(msg_params)
    end

    def start_request(params)
      RestClient.post(
        'https://api.clickatell.com/rest/message',
        params,
        content_type: :json,
        accept: :json,
        'X-Version' => 1,
        'Authorization' => "bearer #{clickatell_key}"
      )
    rescue => e
      e.response
    end

    def assign_attrs_by(response)
      response = JSON.parse(response)

      info = response['data']['message'][0]

      self.status_message = info['error']
      self.api_message_id = info['apiMessageId']
    end
end
