class Sms
  attr_accessor :name,        :type,        :api_message_id,
                :text,        :status,      :status_message,
                :to,          :cost,        :balance

  ## Codes
  STATUSES = { created: 0, sent: 1, delivered: 2, failed: 3 }

  ## Etc.
  def self.send_sms(attrs = {})
    new(attrs).send_sms
  end

  def initialize(attrs = {})
    attrs.each do |name, value|
      send("#{name}=", value)
    end

    @status = STATUSES[:created]
  end
end
