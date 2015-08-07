class Message < ActiveRecord::Base
  belongs_to :user

  scope :current, -> { order(created_at: :desc).limit(5) }

  def as_json(options = {})
    MessageSerializer.new(self).as_json
  end
end
