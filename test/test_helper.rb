require 'minitest/autorun'
require 'webmock/minitest'
require 'smster'

class MiniTest::Test
  def setup
    @statuses = Sms::STATUSES
    @to = (99_999_999 * rand).to_i.to_s
    @text = 'i am smster!'

    stub_send_request
  end
end
