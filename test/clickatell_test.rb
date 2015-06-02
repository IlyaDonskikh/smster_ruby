require './test/test_helper'

class ClickatellTest < Minitest::Test
  def test_should_send
    sms = Sms::Clickatell.send_sms(to: @to, text: @text)

    assert_equal @statuses[:sent], sms.status
  end

  def test_should_modify_to
    to = '+abc' + @to

    sms = Sms::Clickatell.send_sms(to: to, text: @text)

    assert_equal to.gsub(/\D/, ''), sms.to
  end

  def test_should_modify_text
    sms = Sms::Clickatell.send_sms(to: @to, text: @text)

    assert_equal @text.tr(' ', '+'), sms.text
  end

  private

    def stub_send_request
      body = { data: { message: ['apiMessageId' => 15] } }.to_json

      stub_request(:post, 'https://api.clickatell.com/rest/message')
        .to_return(status: 200, body: body, headers: {})
    end
end
