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

  def self.calc_margin(secs)
    secs - (60 * 60 * 8 * valid_count)
  end
end
