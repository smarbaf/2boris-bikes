require 'bike'

describe Bike do

  it {is_expected.to respond_to :working? }

  it 'can be reported broken' do
    # bike = Bike.new
    subject.report_broken # use subject again instead of the line above to be DRY
    expect(subject).to be_broken
  end


end