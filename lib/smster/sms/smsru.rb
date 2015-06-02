class Sms::Smsru < Sms
  private

    def modify_params
      self.to = to.gsub(/\D/, '')
    end

    def send_request
      config = Smster.configuration
      api_id = config.smsru_api_id

      RestClient.post(
        'http://sms.ru/sms/send',
        'api_id' => api_id,
        'text' => text,
        'to' => to,
        'from' => name
      )
    end

    def generate_send_resonse(response)
      return unless response.include?('100')

      (/\n(.*)\n/).match(response)[1]
    end
end
