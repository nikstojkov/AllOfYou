class Opportunity < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :opportunity_tags
  has_many :artists, through: :applications
  has_many :applications
end
