class Issue < ActiveRecord::Base
  scope :high, -> { where('score > ?', 15) }
  scope :medium, -> { where('score > ? AND score < ?', 0.0, 15) }
  scope :low, -> { where('score = ?', 0.0) }
  scope :active, -> { where('expired_at IS NULL') }
  scope :inactive, -> { where('expired_at IS NOT NULL')}
end
