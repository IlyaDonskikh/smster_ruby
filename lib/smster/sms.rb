class Sms
  attr_accessor :name,        :type,        :to,
                :text,        :status,      :status_message

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
    api_message_id = send_to_provider

    self.status = STATUSES[:sent] if api_message_id
    self.status ||= STATUSES[:failed]

    self
  end

  private

    def send_to_provider
      modify_params

      response = send_request
      generate_send_resonse(response)
    end
end
