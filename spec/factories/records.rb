# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :record do
    recorded_on '2014-07-01'
    started_at  '2014-07-01 10:00:00'
    ended_at    '2014-07-01 19:00:00'
    break_time  1.0
    absence     0
  end
end
