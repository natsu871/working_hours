class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.date     :recorded_on, null: false
      t.datetime :started_at
      t.datetime :ended_at
      t.float    :break_time, null: false, default: 1.0
      t.integer  :absence, null: false, default: 0

      t.timestamps
    end
  end
end
