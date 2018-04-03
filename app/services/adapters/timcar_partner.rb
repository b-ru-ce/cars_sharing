class Adapters::TimcarPartner
	@data_url = 'https://service.timcar.ru/api/cars'

	@data_map = {
		car: {
			path: "cars",
			fields_map: {
					name: { path: "Brand", compute: lambda { |data, current_value| current_value + ' ' + data.dig("Model") }  },
					latitude: { path: "Lat" },
					longitude: { path: "Lon" },
					status: { path: "status", callback: lambda { |status| :active } },
					foreign_id: { path: "Id" },
				}
		}
	}


  class << self
    attr_reader :data_url, :data_map

    def prepare_database partner
    	Car.where(partner: partner).delete_all
    end
  end

end