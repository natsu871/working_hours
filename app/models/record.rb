class Record < ActiveRecord::Base
  ABSENCE_TYPES = {
    nothing: "-",
    all_day: "有給休暇（終日）",
    half_day: "有給休暇（半日）"
  }.freeze

  enum absence: ABSENCE_TYPES.keys
  validates :recorded_on, presence: true
  validates :break_time, presence: true
  validates :absence, presence: true

  def self.valid_count
    where('started_at is not null').where('ended_at is not null').count
  end

  def self.usual
    where(absence: 0)
  end

  def self.halfday
    where(absence: 2)
  end

  def self.calc_margin(secs)
    secs - (60 * 60 * 8 * usual.valid_count) - (60 * 60 * 4 * halfday.valid_count)
  end
end
