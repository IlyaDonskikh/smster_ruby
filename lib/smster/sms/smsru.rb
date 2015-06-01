class Sms::Smsru < Sms
  private

    def send_to_provider
      phone = to.gsub(/\D/, '')

      response = send_request(text, phone)
      generate_send_resonse(response)
    end

    def send_request(text, phone)
      config = Smster.configuration
      api_id = config.smsru_api_id

      RestClient.post(
        'http://sms.ru/sms/send',
        'api_id' => api_id,
        'text' => text,
        'to' => phone,
        'from' => name
      )
    end

    def generate_send_resonse(response)
      return unless response.include?('100')

      (/\n(.*)\n/).match(response)[1]
    end
end
