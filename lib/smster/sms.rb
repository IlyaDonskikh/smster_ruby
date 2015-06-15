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

  def send_sms
    send_to_provider

    status_name = api_message_id ? :sent : :failed
    self.status = STATUSES[status_name]

    self
  end

  private

    def send_to_provider
      modify_params

      response = send_request
      assign_attrs_by(response)
    end
end
