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

    def assign_attrs_by(response)
      return unless response.include?('100')

      self.api_message_id = (/\n(.*)\n/).match(response)[1]
    end
end
