require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    subject.dock Bike.new
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe 'release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  describe 'dock' do
    it 'raises and error when the station is full' do
      20.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error "Docking Station Full"
    end
    it 'does not release broken bikes' do
      subject.dock Bike.new
      bike = subject.release_bike
      bike.report_broken
      expect { subject.dock Bike.new }.to raise_error "No working bikes available"

    end


  end
end
