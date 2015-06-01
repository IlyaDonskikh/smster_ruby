require './test/test_helper'

class SmsruTest < Minitest::Test
  def test_should_send
    stub_send_request

    @statuses = Sms::STATUSES
    phone = (99_999_999 * rand).to_s
    attrs = { to: phone, text: 'i am smster!' }

    sms = Sms::Smsru.send_sms(attrs)

    assert_equal @statuses[:sent], sms.status
  end

  private

    def stub_send_request
      stub_request(:post, 'http://sms.ru/sms/send')
        .to_return(
          status: 200,
          body:
            '100
            201523-1000007
            balance=52.54',
          headers: {}
        )
    end
end
