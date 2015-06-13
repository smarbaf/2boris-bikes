feature 'Member of the public returns bike' do
  scenario 'bike cannot be docked when the station is full' do
    station = DockingStation.new
    bike = Bike.new # this line and the next constitute station.dock Bike.new or station.dock(Bike.new) where Bike.new is the argument being passed in
    20.times { station.dock(bike) }
    expect { station.dock(bike) }.to raise_error "Docking Station Full"
  end
end