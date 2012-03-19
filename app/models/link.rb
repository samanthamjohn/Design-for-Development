class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, presence: true
  validates :name, presence: true
  validates :user, presence: true
end
