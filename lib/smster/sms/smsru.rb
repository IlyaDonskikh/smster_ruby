class Sms::Smsru < SmsLayer
  attr_accessor :test, :smsru_api_id

  def smsru_api_id
    @smsru_api_id ||= config.smsru_api_id
  end

  def calc_cost
    extract_from(request_cost, /\n(.*)\n?/)
  end

  private

    def modify_params
      self.to = to.gsub(/\D/, '')
    end

    def send_request
      RestClient.post(
        'http://sms.ru/sms/send',
        'api_id' => smsru_api_id,
        'text' => text,
        'to' => to,
        'from' => name,
        'test' => test
      )
    end

    def assign_attrs_by(response)
      self.status_message = response

      return unless response.include?('100')

      self.balance = extract_from(response, /.*\n.*\nbalance=(.*)/)
      self.api_message_id = extract_from(response, /\n(.*)\n?/)
    end

    def request_cost
      RestClient.post(
        'http://sms.ru/sms/cost',
        'api_id' => smsru_api_id,
        'text' => text,
        'to' => to
      )
    end

    def extract_from(response, regexp)
      value = (regexp).match(response)

      value && value[1]
    end
end
