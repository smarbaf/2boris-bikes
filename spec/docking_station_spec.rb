require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    subject.dock double :bike, broken?: false, working?: true
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'raises an error when the station is full' do
    subject.capacity.times { subject.dock double(:bike) }
    expect { subject.dock double(:bike) }.to raise_error 'Docking Station Full'
  end

  it 'does not release broken bikes' do
    bike = double :bike, broken?: true
    subject.dock bike
    allow(bike).to receive(:working?)
    expect {subject.release_bike}.to raise_error 'No working bikes available'
  end
  describe 'capacity' do
    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
    it 'can be adapted' do
      expect(subject.capacity = 50).to eq 50
    end
  end
  describe 'release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end


end
