class Record < ActiveRecord::Base
  enum absence: { nothing: 0, all_day: 1, half_day: 2 }
  validates :recorded_on, presence: true
  validates :break_time, presence: true
  validates :absence, presence: true
end
