class Sms
  attr_accessor :mode,        :type,        :to,
                :text,        :status,      :status_message,
                :name

  ## Codes
  STATUSES = { created: 0, sent: 1, delivered: 2, failed: 3 }

  ## Etc.
  def initialize(attrs = {})
    attrs.each do |name, value|
      send("#{name}=", value)
    end

    @status = STATUSES[:created]
    @mode ||= 'production'
  end
end
