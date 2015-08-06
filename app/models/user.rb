class User < ActiveRecord::Base
  validates :provider, :name, :uid, presence: true
end
