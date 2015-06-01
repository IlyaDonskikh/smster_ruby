require 'minitest/autorun'
require 'smster'

class SmsterTest < Minitest::Test
  def test_should_send
    @statuses = Sms::STATUSES
    phone = (99_999_999 * rand).to_s
    attrs = { to: phone, text: 'i am smster!', mode: 'test' }

    sms = Sms::Smsru.new(attrs)
    sms.send_sms

    assert_equal @statuses[:sent], sms.status
  end
end
