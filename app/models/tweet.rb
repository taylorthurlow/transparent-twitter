class Tweet < ActiveRecord::Base
  enum classification: [:unknown, :neither, :news, :opinion]

  scope :unclassified, -> { where(classification: 'unknown') }
  scope :classified, -> { where.not(classification: 'unknown') }
end
