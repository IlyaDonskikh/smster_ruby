class Sms::SmsUslugi < SmsLayer
  attr_accessor :onlydelivery,    :use_alfasource,      :flash,
                :date_time_send,  :discount_id

  private

    def modify_params
      self.to = to.gsub(/\D/, '')
    end

    def send_request
      RestClient.post(
        "#{base_url}/sendSms.php",
        'login' => config.smsru_uslugi_login,
        'password' => config.smsru_uslugi_pwd,
        'txt' => text,
        'to' => to,
        'source' => name,
        'onlydelivery' => onlydelivery,
        'use_alfasource' => use_alfasource,
        'flash' => flash,
        'dateTimeSend' => date_time_send,
        'discountID' => discount_id
      )
    end

    def assign_attrs_by(response)
      json_response = JSON.parse(response)

      self.status_message = json_response['descr']
      self.api_message_id = json_response['smsid']
      self.cost = json_response['priceOfSending']
    end

    def base_url
      'https://lcab.sms-uslugi.ru/lcabApi'
    end
end
