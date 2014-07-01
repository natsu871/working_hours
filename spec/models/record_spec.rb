require 'rails_helper'

RSpec.describe Record, :type => :model do
  describe '#valid?' do
    context 'recorded_on が空のとき' do
      subject(:record) { FactoryGirl.build(:record, recorded_on: '') }
      specify { expect(subject).not_to be_valid }
    end
    context 'break_time が空のとき' do
      subject(:record) { FactoryGirl.build(:record, break_time: '') }
      specify { expect(subject).not_to be_valid }
    end
    context 'absence が空のとき' do
      subject(:record) { FactoryGirl.build(:record, absence: '') }
      specify { expect(subject).not_to be_valid }
    end
  end
end
