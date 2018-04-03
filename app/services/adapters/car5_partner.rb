class Adapters::Car5Partner
	@data_url = 'https://www.car5.ru/car5/rs/car5.get.list.php?desktop=1'

	@data_map = {
		car: {
			path: [0, "data" , "arrCar"],
			fields_map: {
					name: { path: "name" },
					latitude: { path: "latitude" },
					longitude: { path: "longitude" },
					status: { path: "status", callback: lambda { |status| @status_map[status.to_s] || @status_map[:default] } },
					reg_number: { path: "gnum" },
					foreign_id: { path: "id" },
					fuel: { path: "fuel" },
					mileage: { path: "mileage" },
					fuel_max: { path: "fuelmax" }
				}
		}
	}
  

	@status_map = {
		"1" => :active,
		:default => :unknown_status
	}

  class << self
    attr_reader :data_url, :data_map
  end

end