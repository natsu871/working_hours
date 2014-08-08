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
end
