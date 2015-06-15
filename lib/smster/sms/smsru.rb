class Sms::Smsru < Sms
  attr_accessor :test, :smsru_api_id

  def smsru_api_id
    config = Smster.configuration
    @smsru_api_id = config.smsru_api_id
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

      self.balance = extract_balance_from(response)
      self.api_message_id = extract_api_message_id_from(response)
      self.cost = calc_cost
    end

    def extract_api_message_id_from(response)
      id_reg = (/\n(.*)\n?/).match(response)

      id_reg && id_reg[1]
    end

    def extract_balance_from(response)
      balance_reg = (/.*\n.*\nbalance=(.*)/).match(response)

      balance_reg && balance_reg[1]
    end

    def calc_cost
      response = request_cost

      extract_cost_from(response)
    end

    def request_cost
      RestClient.post(
        'http://sms.ru/sms/cost',
        'api_id' => smsru_api_id,
        'text' => text,
        'to' => to
      )
    end

    def extract_cost_from(response)
      cost = (/\n(.*)\n?/).match(response)

      cost && cost[1]
    end
end
