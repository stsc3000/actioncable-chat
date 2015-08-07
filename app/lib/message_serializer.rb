class MessageSerializer
  include ActionView::Helpers::SanitizeHelper
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def as_json
    {
      body: sanitize(message.body),
      created_at: I18n.l(message.created_at, format: :short)
    }
  end
end
