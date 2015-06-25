module Smster
  class Configuration
    attr_accessor :nexmo_key,           :nexmo_sekret,
                  :smsru_api_id,        :clickatell_authorization_code,
                  :smsru_uslugi_login,  :smsru_uslugi_pwd

    def initialize
      @nexmo_key = ''
      @nexmo_sekret = ''
      @clickatell_authorization_code = ''
      @smsru_api_id = ''
      @smsru_uslugi_login = ''
      @smsru_uslugi_pwd = ''
    end
  end
end
