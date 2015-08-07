class Message < ActiveRecord::Base
  belongs_to :user

  scope :current, -> { order(created_at: :desc).limit(5) }
end
