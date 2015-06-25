require './test/test_helper'

class SmsUslugiTest < Minitest::Test
  def test_should_send
    sms = Sms::SmsUslugi.send_sms(to: @to, text: @text)

    assert_equal @statuses[:sent], sms.status
  end

  private

    def stub_send_request
      body = generate_send_request_body

      stub_request(:post, 'https://lcab.sms-uslugi.ru/lcabApi/sendSms.php')
        .to_return(status: 200, body: body, headers: {})
    end

    def generate_send_request_body
      {
        code: 1,
        descr: 'Success',
        smsid: '966a995b775db12f701b75e4b11c10d5',
        colsmsOfSending: 1,
        priceOfSending: '0.67',
        colAbonentSend: 1
      }.to_json
    end
end
