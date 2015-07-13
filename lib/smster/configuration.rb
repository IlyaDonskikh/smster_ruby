module Smster
  class Configuration
    attr_accessor :nexmo_key,           :nexmo_sekret,
                  :smsru_api_id,        :clickatell_authorization_code,
                  :sms_uslugi_login,    :sms_uslugi_pwd

    def initialize
      @nexmo_key = ''
      @nexmo_sekret = ''
      @clickatell_authorization_code = ''
      @smsru_api_id = ''
      @sms_uslugi_login = ''
      @sms_uslugi_pwd = ''
    end
  end
end
