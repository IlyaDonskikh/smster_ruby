class SmsLayer < Sms
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