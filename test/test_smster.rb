require 'minitest/autorun'
require 'smster'

class SmsterTest < Minitest::Test
  def test_example
    @statuses = Sms::STATUSES

    sms = Sms::Smsru.new(to: '79050958806', text: 'i am smster!!!')
    sms.send_sms

    assert_equal @statuses[:sent], sms.status
  end
end
