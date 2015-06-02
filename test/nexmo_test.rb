require './test/test_helper'

class NexmoTest < Minitest::Test
  def test_should_send
    sms = Sms::Nexmo.send_sms(to: @to, text: @text)

    assert_equal @statuses[:sent], sms.status
  end

  def test_should_modify_to
    to = '+abc' + @to

    sms = Sms::Nexmo.send_sms(to: to, text: @text)

    assert_equal to.gsub(/\D/, ''), sms.to
  end

  def test_should_modify_text
    sms = Sms::Nexmo.send_sms(to: @to, text: @text)

    assert_equal @text.tr(' ', '+'), sms.text
  end

  private

    def stub_send_request
      body = { messages: ['message-id' => 15] }.to_json

      stub_request(:post, 'https://rest.nexmo.com/sms/json')
        .to_return(status: 200, body: body, headers: {})
    end
end
