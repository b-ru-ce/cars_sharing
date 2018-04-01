class Adapters::DelimobilPartner
	@data_url = 'https://delimobil.ru/maps-data?action=cars&alias=ru'

	@data_map = {
		car: {
			path: "features",
			fields_map: {
					name: { path: "model" },
					latitude: { path: ["geometry", "coordinates" , 0] },
					longitude: { path: ["geometry", "coordinates" , 1] },
					status: { path: "status", callback: lambda { |status| p status + " ssssss " + @status_map[status.to_s].to_s ;  @status_map[status.to_s] || @status_map[:default] } },
					reg_number: { path: "reg_number" },
					foreign_id: { path: "id" },
					fuel: { path: "fuel" }
				}
		}
	}
  
	@status_map = {
		"available" => :active,
		:default => :unknown_status
	}

  class << self
    attr_reader :data_url, :data_map
  end

end