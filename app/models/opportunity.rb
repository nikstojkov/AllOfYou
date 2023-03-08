class Opportunity < ApplicationRecord
  belongs_to :user
  has_many :opportunity_tags, dependent: :destroy
  has_many :tags, through: :opportunity_tags
  has_many :applications, dependent: :destroy
  has_many :artists, through: :applications
end
