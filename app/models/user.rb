class User < ActiveRecord::Base
  has_many :messages
  validates :provider, :name, :uid, presence: true
end
